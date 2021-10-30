let mapleader =" "

nmap <leader>ff :Telescope find_files<CR>
nmap <leader>fg :Telescope live_grep<CR>
nmap <leader>fw :Telescope grep_string<CR>
nmap <leader>gs :Telescope git_status<CR>
nmap <leader>gc :Telescope git_commits<CR> 
nmap <leader>b :Telescope buffers<CR> 

nmap <Leader>s <Plug>(easymotion-s2)

nmap <Leader>n :NvimTreeToggle<CR>
nmap <Leader>rn :NvimTreeRefresh<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>cb :bd<CR>
nmap <Leader>qq :q!<CR>
nmap <Leader>rg :Rg<CR>
nmap <Leader>f :GFiles<CR 
nmap <Leader>r :%s//g<Left><Left>
nmap <Leader>e :e!<CR> 
