local status, tt = pcall(require, "toggleterm")
if (not status) then return end

tt.setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-t>]],
  direction = 'float'
}
