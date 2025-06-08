if exists('g:vscode')
	" VSCode extension

	set scrolloff=10
	set showmode
	set showcmd
	set visualbell
	set ignorecase
	set smartcase
	set hlsearch
	set incsearch
	set number
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set expandtab
	set clipboard+=unnamed
	set ttimeout
	set ttimeoutlen=50

	" Set the leader key
	let mapleader = "\<space>"

	" Remap jk to `Esc`
	inoremap jk <Esc>

	" Unbinds the Space key as it's used as the leader key
	nnoremap <Space> <NOP>

	" `Esc` removes search highlights
	nmap <Esc> :nohl<CR>

	" `=` - Reformat code in the selected scope
	nnoremap = <Cmd>lua require('vscode').action('editor.action.formatDocument')<CR>

	" `<leader> + w(indow) + p(in)` - Toggle the pin status of the document
	" `<leader> + w(indows) + c(lose) + a(ll)` - Close all unpinned documents
	nnoremap <leader>wp <Cmd>lua require('vscode').action('workbench.action.pinEditor')<CR>
	nnoremap <leader>wc <Cmd>lua require('vscode').action('workbench.action.closeActivePinnedEditor')<CR>

	" `g + t(ab)` - Navigate to the next tab
	" `g + T(ab)` - Navigate to the previous tab
	nnoremap gt <Cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>
	nnoremap gT <Cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>

	" `g + .` - Show action indicators and action list
	nnoremap g. <Cmd>lua require('vscode').action('editor.action.quickFix')<CR>

	" `<leader> + r(emove) + s(ort)` - Remove and sort 'usings'
	nnoremap <leader>rs <Cmd>lua require('vscode').action('editor.action.organizeImports')<CR>

	" `]` - Navigate to the next member / type / tag
	" `[` - Navigate to the previous member / type / tag
	nnoremap ] <Cmd>lua require('vscode').action('editor.gotoNextFold')<CR>
	nnoremap [ <Cmd>lua require('vscode').action('editor.gotoPreviousFold')<CR>

	" `g + n(avigate)` - Move forward through navigation history
	" `g + N(avigate)` - Move backward through navigation history
	nnoremap gn <Cmd>lua require('vscode').action('workbench.action.navigateForward')<CR>
	nnoremap gN <Cmd>lua require('vscode').action('workbench.action.navigateBack')<CR>

	" Improves navigation when wrapping
	" by swapping `j` with `gj` and `k` with `gk`
	nnoremap j gj
	nnoremap gj j
	nnoremap k gk
	nnoremap gk k

	" A declaration introduces an identifier and describes its type, be it a type, object, or function. A declaration is what the compiler needs to accept references to that identifier.
	" A definition actually instantiates/implements this identifier. It's what the linker needs in order to link references to those entities.
	" A definition can be used in the place of a declaration.
	" Not really a difference in Visual Studio.

	" `g(o to) + d(efinition)` - Go to definition
	" `g(o to) + D(eclaration)` - Go to declaration
	" `g(o to) + (t)y(pe definition)` - Go to type definition
	" `g(o to) + i(mplementation)` - Go to implementation
	" `g(o to) + A(all references)` - Go to all references to the current word
	" `c(hange) + d(definition)` - Rename (change definition)
	" `r(egion) + c(ollapse)` - Collapse current region
	" `r(egion) + e(xpand)` - Expand current region
	" `r(egion) + C(ollapse)` - Collapse all regions
	" `r(egion) + E(xpand)` - Expand all regions
	nnoremap gd <Cmd>lua require('vscode').action('editor.action.revealDefinition')<CR>
	nnoremap gD <Cmd>lua require('vscode').action('editor.action.revealDeclaration')<CR>
	nnoremap gy <Cmd>lua require('vscode').action('editor.action.goToTypeDefinition')<CR>
	nnoremap gi <Cmd>lua require('vscode').action('editor.action.goToImplementation')<CR>
	nnoremap gA <Cmd>lua require('vscode').action('editor.action.goToReferences')<CR>
	nnoremap cd <Cmd>lua require('vscode').action('editor.action.rename')<CR>
	nnoremap rc <Cmd>lua require('vscode').action('editor.fold')<CR>
	nnoremap re <Cmd>lua require('vscode').action('editor.unfold')<CR>
	nnoremap rC <Cmd>lua require('vscode').action('editor.foldAll')<CR>
	nnoremap rE <Cmd>lua require('vscode').action('editor.unfoldAll')<CR>

	" `g(o to) + e(rror)` - Go to next error
	" `g(o to) + E(rror)` - Go to previous error
	nnoremap ge <Cmd>lua require('vscode').action('editor.action.marker.next')<CR>
	nnoremap gE <Cmd>lua require('vscode').action('editor.action.marker.prev')<CR>

	" `g + /` - Open a project-wide search
	nnoremap g/ <Cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>

	" `<leader> + b + b(reakpoint)` - Toggle a breakpoint at the current line
	" `<leader> + b(reakpoints) + r(emove)` - Remove all breakpoints
	nnoremap <leader>bb <Cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>
	nnoremap <leader>br <Cmd>lua require('vscode').action('workbench.debug.viewlet.action.removeAllBreakpoints')<CR>

	" `<leader> + s(tart) + d(ebug)` - Start with debugging
	" `<leader> + s(tart) + r(un)` - Start without debugging
	" `<leader> + s(tarted) + d(ebug) + c(ancel)` - Stop debugging
	nnoremap <leader>sd <Cmd>lua require('vscode').action('workbench.action.debug.start')<CR>
	nnoremap <leader>sr <Cmd>lua require('vscode').action('workbench.action.debug.run')<CR>
	nnoremap <leader>sdc <Cmd>lua require('vscode').action('workbench.action.debug.stop')<CR>

	" `<Ctrl> + <Left>` - Move execution pointer to the selected statement
	" `<Ctrl> + <Right>` - Step over
	" `<Ctrl> + <Down>` - Step into
	" `<Ctrl> + <Up>` - Step out
	nnoremap <C-Left> <Cmd>lua require('vscode').action('debug.jumpToCursor')<CR>
	nnoremap <C-Right> <Cmd>lua require('vscode').action('workbench.action.debug.stepOver')<CR>
	nnoremap <C-Down> <Cmd>lua require('vscode').action('workbench.action.debug.stepInto')<CR>
	nnoremap <C-Up> <Cmd>lua require('vscode').action('workbench.action.debug.stepOut')<CR>

	" `<leader> + /` - Comment/uncomment the current line
	nnoremap <leader>/ <Cmd>lua require('vscode').action('editor.action.commentLine')<CR>
else
	" ordinary Neovim
endif
