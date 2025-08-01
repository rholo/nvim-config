local st, fzflua = pcall(require, 'fzf-lua')
if (not st) then return end

fzflua.setup({
buffers = {
    fzf_opts = {
      ['--bind'] = 'ctrl-j:down,ctrl-k:up'
    }
  },
fzf_opts = {
    ['--bind'] = table.concat({
      'ctrl-j:down',
      'ctrl-k:up',
      'ctrl-q:toggle-all',
      'ctrl-a:toggle',
    }, ','),
  }
})


