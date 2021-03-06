require 'redcarpet'
require 'erb'

# operators and execution times in milliseconds
module OPS 
    K = 230 #Keystroke
    T = Hash.new {|t, keys| t[keys] = keys*230} #Sequence of Keystrokes
    P = 1500 #Point with mouse
    S = 230 #Move eyes
    H = 360 #Move hands between keyboard/mouse
    M = 1200 #think
end

def render(ops)
    table = []
    table << "Description | Operation | Time"
    table << "---|---|---"
    # Holy functional programming, Batman!
    table << ops.each.map{|k,v| [k, v, eval("OPS::#{v}").to_s+" ms"].join(" | ")}.join("\n")
    total_time = ops.map{|o| eval("OPS::#{o[1]}")}.inject(:+);
    table << "Total: | | #{total_time/1000}.#{total_time%1000/10} seconds"
    table.join("\n")
end

render_options = {with_toc_data: true}
extensions = {autolink: true, 
    fenced_code_blocks: true, 
    lax_spacing: true,
    hard_wrap: true,
    tables: true}
md = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options), extensions)
template = ERB.new(File.read('template.erb'))

content = []

content << "# HCI GOMS Thing"
content << "*Quinn Rohlf*"
content << "## Design A"
content << '### one-number query'
designA = [] \
<< ['Locate menu', 'S'] \
<< ['Mouse to menu', 'P'] \
<< ['Decide on database', 'M'] \
<< ['Click database', 'P'] \
<< ['Drag mouse right', 'P'] \
<< ['Pick query option', 'P'] \
<< ['Locate dialog box input', 'S'] \
<< ['Mouse to input', 'P'] \
<< ['Type telephone number', 'T[8]'] \
<< ['Locate add button', 'S'] \
<< ['Click add button', 'P'] \
<< ['Locate okay button', 'S'] \
<< ['Click okay button', 'P']
content << render(designA)

content << '### two-number query'

designA << ['Locate dialog box input', 'S'] \
<< ['Mouse to input', 'P'] \
<< ['Type telephone number', 'T[8]'] \
<< ['Locate add button', 'S'] \
<< ['Click add button', 'P'] \
<< ['Locate okay button', 'S'] \
<< ['Click okay button', 'P']
content << render(designA)

content << "## Design B"
content << '### one-number query'
designB = [] \
<< ['Locate telephone number', 'S'] \
<< ['Mouse to telephone number', 'P'] \
<< ['Decide on database', 'M'] \
<< ['Click database', 'P'] \
<< ['Pick query option', 'P']
content << render(designB)

content << '### two-number query'
content << render(designB*2)

content << "## Notes"
content << "I probably spent about an hour writing the code to generate these tables and twenty minutes building the models that give the estimates in this file."
content << "The `hci-goms.rb` file (listed above) generates this file as well as an html file when `ruby hci-goms.rb` is run."

markdown = content.join("\n\n")
body = md.render(markdown)
File.write('Readme.md', markdown)
File.write('output.html', template.result)