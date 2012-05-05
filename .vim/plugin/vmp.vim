function! PreviewMKD()
  let VMP_PLUGIN_SCRIPT_NAME = 'vmp.vim'
  
  " Get the output of ":scriptnames" in the scriptnames_output variable.
  let scriptnames_output = ''
  redir => scriptnames_output
  silent scriptnames
  redir END

  " Split the output into lines and parse each line.	Add an entry to the
  " "scripts" dictionary.
  let scripts = {}
  for line in split(scriptnames_output, "\n")
    if line =~ '\S'
      let nr = matchstr(line, '\d\+')
      let name = substitute(line, '.\+:\s*', '', '')
      let scripts[nr] = name
    endif
  endfor
  unlet scriptnames_output

  " if use pathogen, the plugin dir could be something looks like ~/.vim/bundle/vim-markdown-preview/plugin
  for script_path in values(scripts)
    if script_path =~ '[\\/]' . VMP_PLUGIN_SCRIPT_NAME . '$'
      let vmp_plugin_dir = substitute(script_path, '[\\/]' . VMP_PLUGIN_SCRIPT_NAME . '$', '', '')
    endif
  endfor

ruby << RUBY
  vmp_plugin_dir = VIM.evaluate('vmp_plugin_dir')

  VIM.evaluate('&runtimepath').split(',').each do |path|
    $LOAD_PATH.unshift(File.join(path, 'plugin', 'vim-markdown-preview'))
  end

  require('kramdown/kramdown')

  text = Array.new(VIM::Buffer.current.count) do |i|
    VIM::Buffer.current[i + 1]
  end.join("\n")

  VIM::Buffer.current.name.nil? ? (name = 'No Name.md') : (name = VIM::Buffer.current.name)

  layout = <<-LAYOUT
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link type="text/css" rel="stylesheet" media="screen" href="file://#{vmp_plugin_dir}/vim-markdown-preview/css/bundle_common.css">
  <link type="text/css" rel="stylesheet" media="screen" href="file://#{vmp_plugin_dir}/vim-markdown-preview/css/bundle_github.css">

  <title> #{File.basename(name)} </title>
  </head>
  <body>
    <div id="main class="subnavd">
      <div class="site">
        <div class="announce mkd" id="readme">
          <span class="name">#{File.basename(name)}</span>
          <div class="wikistyle">
            #{Kramdown::Document.new(text).to_html}
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
  LAYOUT

  unless File.extname(name) =~ /.(md|mkd|markdown)/
    VIM.message('This file extension is not supported for Markdown previews')
  else
    file = File.join('/tmp', File.basename(name) + '.html')
    File.open('%s' % [ file ], 'w') { |f| f.write(layout) }
    Vim.command("silent !open '%s'" % [ file ])
  end
RUBY
endfunction

:command! Mm :call PreviewMKD()

