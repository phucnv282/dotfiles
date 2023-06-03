local status, be = pcall(require, "better_escape")
if not status then
  return
end

be.setup {
  mapping = { "jk" }
}
