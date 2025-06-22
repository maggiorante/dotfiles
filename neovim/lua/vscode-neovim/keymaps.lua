local keymap = vim.keymap.set
local opts = { noremap = true, silent = false }
local vscode = require("vscode")
local action = vscode.action

-- Remap jk to `Esc`
-- keymap("i", "jk", "<Esc>", { noremap = false, silent = false })

-- `=` - Reformat code in the selected scope
keymap("n", "=", function() action('editor.action.formatDocument') end, opts)

-- `<leader> + w(indow) + p(in)` - Toggle the pin status of the document
-- `<leader> + w(indows) + c(lose) + a(ll)` - Close all unpinned documents
keymap("n", "<leader>wp", function() action('workbench.action.pinEditor') end, opts)
keymap("n", "<leader>wc", function() action('workbench.action.closeActivePinnedEditor') end, opts)

-- `g + t(ab)` - Navigate to the next tab
-- `g + T(ab)` - Navigate to the previous tab
keymap("n", "gt", function() action('workbench.action.nextEditor') end, opts)
keymap("n", "gT", function() action('workbench.action.previousEditor') end, opts)

-- `g + .` - Show action indicators and action list
keymap("n", "g.", function() action('editor.action.quickFix') end, opts)

-- `<leader> + r(emove) + s(ort)` - Remove and sort 'usings'
keymap("n", "<leader>rs", function() action('editor.action.organizeImports') end, opts)

-- `]` - Navigate to the next member / type / tag
-- `[` - Navigate to the previous member / type / tag
keymap("n", "]", function() action('editor.gotoNextFold') end, opts)
keymap("n", "[", function() action('editor.gotoPreviousFold') end, opts)

-- `g + n(avigate)` - Move forward through navigation history
-- `g + N(avigate)` - Move backward through navigation history
keymap("n", "gn", function() action('workbench.action.navigateForward') end, opts)
keymap("n", "gN", function() action('workbench.action.navigateBack') end, opts)

-- A declaration introduces an identifier and describes its type, be it a type, object, or function. A declaration is what the compiler needs to accept references to that identifier.
-- A definition actually instantiates/implements this identifier. It's what the linker needs in order to link references to those entities.
-- A definition can be used in the place of a declaration.
-- Not really a difference in Visual Studio.

-- `g(o to) + d(efinition)` - Go to definition
-- `g(o to) + D(eclaration)` - Go to declaration
-- `g(o to) + (t)y(pe definition)` - Go to type definition
-- `g(o to) + i(mplementation)` - Go to implementation
-- `g(o to) + A(all references)` - Go to all references to the current word
-- `c(hange) + d(definition)` - Rename (change definition)
-- `r(egion) + c(ollapse)` - Collapse current region
-- `r(egion) + e(xpand)` - Expand current region
-- `r(egion) + C(ollapse)` - Collapse all regions
-- `r(egion) + E(xpand)` - Expand all regions
keymap("n", "gd", function() action('editor.action.revealDefinition') end, opts)
keymap("n", "gD", function() action('editor.action.revealDeclaration') end, opts)
keymap("n", "gy", function() action('editor.action.goToTypeDefinition') end, opts)
keymap("n", "gi", function() action('editor.action.goToImplementation') end, opts)
keymap("n", "gA", function() action('editor.action.goToReferences') end, opts)
keymap("n", "cd", function() action('editor.action.rename') end, opts)
keymap("n", "rc", function() action('editor.fold') end, opts)
keymap("n", "re", function() action('editor.unfold') end, opts)
keymap("n", "rC", function() action('editor.foldAll') end, opts)
keymap("n", "rE", function() action('editor.unfoldAll') end, opts)

-- `g(o to) + e(rror)` - Go to next error
-- `g(o to) + E(rror)` - Go to previous error
keymap("n", "ge", function() action('editor.action.marker.next') end, opts)
keymap("n", "gE", function() action('editor.action.marker.prev') end, opts)

-- `g + /` - Open a project-wide search
keymap("n", "g/", function() action('workbench.action.findInFiles') end, opts)

-- `<leader> + b + b(reakpoint)` - Toggle a breakpoint at the current line
-- `<leader> + b(reakpoints) + r(emove)` - Remove all breakpoints
keymap("n", "<leader>bb", function() action('editor.debug.action.toggleBreakpoint') end, opts)
keymap("n", "<leader>br", function() action('workbench.debug.viewlet.action.removeAllBreakpoints') end, opts)

-- `<leader> + s(tart) + d(ebug)` - Start with debugging
-- `<leader> + s(tart) + r(un)` - Start without debugging
-- `<leader> + s(tarted) + d(ebug) + c(ancel)` - Stop debugging
keymap("n", "<leader>sd", function() action('workbench.action.debug.start') end, opts)
keymap("n", "<leader>sr", function() action('workbench.action.debug.run') end, opts)
keymap("n", "<leader>sdc", function() action('workbench.action.debug.stop') end, opts)

-- `<Ctrl> + <Left>` - Move execution pointer to the selected statement
-- `<Ctrl> + <Right>` - Step over
-- `<Ctrl> + <Down>` - Step into
-- `<Ctrl> + <Up>` - Step out
keymap("n", "<C-Left>", function() action('debug.jumpToCursor') end, opts)
keymap("n", "<C-Right>", function() action('workbench.action.debug.stepOver') end, opts)
keymap("n", "<C-Down>", function() action('workbench.action.debug.stepInto') end, opts)
keymap("n", "<C-Up>", function() action('workbench.action.debug.stepOut') end, opts)

-- `<leader> + /` - Comment/uncomment the current line
keymap("n", "<leader>/", function() action('editor.action.commentLine') end, opts)
