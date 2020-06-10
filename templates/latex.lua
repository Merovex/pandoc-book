-- This gives us plain fancy break in LaTeX.
local hashrule = [[<w:p>
  <w:pPr>
    <w:pStyle w:val="HorizontalRule"/>
      <w:ind w:firstLine="0"/>
      <w:jc w:val="center"/>
  </w:pPr>
  <w:r>
    <w:t>#</w:t>
  </w:r>
</w:p>]]
function HorizontalRule (elem)
    -- print("FORMAT: " .. FORMAT)
    if FORMAT == 'latex' then
      return pandoc.RawBlock('latex', '\\pfbreak')
    end
    if FORMAT == 'docx' then
      return pandoc.RawBlock('openxml', hashrule)
    end
end
-- function dump(o)
--    if type(o) == 'table' then
--       local s = '{ '
--       for k,v in pairs(o) do
--          if type(k) ~= 'number' then k = '"'..k..'"' end
--          s = s .. '['..k..'] = ' .. dump(v) .. ','
--       end
--       return s .. '}\n '
--    else
--       return tostring(o)
--    end
-- end
-- width, height in millimeters
-- Demy       = {138, 216},
local trimsizes = {
  Novella    = {127, 203}, -- 5" x 8"
  UKBFormat  = {129, 198}, -- 5.06" x 7.81" Never Split the Difference
  SmallTrade = {133, 203}, -- 5.25" x 8" A Song of Stone
  Digest     = {140, 215}, -- 5.5" x 8.5"
  Trade      = {152, 229}, -- 6" x 9"
  Royal      = {156, 234}, -- 6.14" x 9.21" A Short History of Parliament
  Textbook   = {178, 254}, -- 7" x 10"
  Crown      = {189, 246}, -- 7.44" x 9.69"
  LargeTrade = {203, 254}, -- 8" x 10"
  A4         = {210, 297},  -- 8.27" x 11.69"
  Letter     = {216, 279}, -- 8.5" x 11"
  Square     = {216, 216}  -- 8.5" x 8.5"
}

-- counts words in a document
words = 0
char  = 0
wordcount = {
  Str = function(el)
    -- we don't count a word if it's entirely punctuation:
    if el.text:match("%P") then
        words = words + 1
    end
    char  = char + el.text:len()
  end,

  Code = function(el)
    _,n = el.text:gsub("%S+","")
    words = words + n
    char  = char + el.text:len()
  end,

  CodeBlock = function(el)
    _,n = el.text:gsub("%S+","")
    words = words + n
    char  = char + el.text:len()
  end
}
local function addFancyPageBreak(meta)
  if type(meta.fancybreak) ~= 'table' then return meta end
  local header_includes
  local fancybreak = ""
  for key, value in pairs(meta.fancybreak) do fancybreak = fancybreak .. value.text end

  fancybreak = string.format(
    [[\renewcommand{\pfbreakdisplay}{%s}\renewcommand*{\fancybreak}{\pfbreakdisplay}]]
  , fancybreak)

  if meta['header-includes'] and meta['header-includes'].t == 'MetaList' then
      header_includes = meta['header-includes']
  else
      header_includes = pandoc.MetaList{meta['header-includes']}
  end
  header_includes[#header_includes + 1] =
      pandoc.MetaBlocks{pandoc.RawBlock('latex', fancybreak)}
  meta['header-includes'] = header_includes
  return meta
end
function addTrimsizeGeometry(meta)
  local key = pandoc.utils.stringify(meta.trimsize)
  if trimsizes[key] == nil then
    print("Invalid Trimsize, using 'Trade'. You used '"..key.."'.")
    key = "Trade"
  end

  local trimsize = trimsizes[key]
  local bindingoffset = 4 + math.floor(pages/80) -- Offset in MM by page.
  table.insert(trimsize, bindingoffset)

  meta.geometry = string.format(
    [[
      paperwidth=%dmm,paperheight=%dmm,
      includeheadfoot=true,vscale=0.925,headsep=3mm,vcentering,
      bindingoffset=%dmm,hscale=0.8,twoside]],
    table.unpack(trimsize)
  )
  return meta
end

function Pandoc(doc)
  pandoc.walk_block(pandoc.Div(doc.blocks), wordcount)
  wchar = math.ceil(char / 5) -- Using the English norm of 5 characters per word.
  pages = math.ceil(wchar / 330) + 6
  local meta = doc.meta
  meta.wordcount = string.format("%d",wchar)
  meta.pagecount = string.format("%d",pages)

  if FORMAT == 'latex' then
    meta = addFancyPageBreak(meta)
    meta = addTrimsizeGeometry(meta)

    if (meta.fontsize == nil)  then meta.fontsize  = "10pt" end
    if (meta.pagestyle == nil) then meta.pagestyle  = "myheadings" end
    print("Words.."..wchar)
  end
  return pandoc.Pandoc(doc.blocks, meta)
end
