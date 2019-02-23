-- This gives us plain fancy break in LaTeX.
function HorizontalRule (elem)
    return pandoc.RawBlock('latex', '\\pfbreak')
end
