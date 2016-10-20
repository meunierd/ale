" Author: Bart Libert <bart.libert@gmail.com>
" Description: cppcheck linter for c files

if exists('g:loaded_ale_linters_c_cppcheck')
    finish
endif

let g:loaded_ale_linters_c_cppcheck = 1

" Set this option to change the cppcheck options
if !exists('g:ale_c_cppcheck_options')
    let g:ale_c_cppcheck_options = '--enable=style'
endif

call ale#linter#Define('c', {
\   'name': 'cppcheck',
\   'output_stream': 'both',
\   'executable': 'cppcheck',
\   'command': g:ale#util#stdin_wrapper . ' .c cppcheck -q --language=c '
\       . g:ale_c_cppcheck_options,
\   'callback': 'ale#handlers#HandleCppCheckFormat',
\})
