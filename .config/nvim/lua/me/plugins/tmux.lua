local module = {}

module.config = function()
  vim.cmd([[
    augroup netrw_mapping
      autocmd!
      autocmd filetype netrw call NetrwMapping()
    augroup END

    function! NetrwMapping()
      nnoremap <silent> <buffer> <c-l> :TmuxNavigateRight<CR>
    endfunction
  ]])
end

return module
