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
    total_time = 0;
    table = Array.new
    table << "Description | Operation | Time"
    table << "---|---|---"
    ops.each do |key, val|
        time = eval("OPS::#{val}")
        total_time += time
        table << "#{key} | #{val} | #{time} ms"
    end

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

content = Array.new

content << "# HCI GOMS Thing"
content << "*Quinn Rohlf*"
content << "## Design A"
content << '### one-number query'
designA = []

designA << ['Locate menu', 'S']
designA << ['Mouse to menu', 'P']
designA << ['Decide on database', 'M']
designA << ['Click database', 'P']
designA << ['Drag mouse right', 'P']
designA << ['Pick query option', 'P']
designA << ['Locate dialog box input', 'S']
designA << ['Mouse to input', 'P']
designA << ['Type telephone number', 'T[8]']
designA << ['Locate add button', 'S']
designA << ['Click add button', 'P']
designA << ['Locate okay button', 'S']
designA << ['Click okay button', 'P']
content << render(designA)

content << '### two-number query'

designA << ['Locate dialog box input', 'S']
designA << ['Mouse to input', 'P']
designA << ['Type telephone number', 'T[8]']
designA << ['Locate add button', 'S']
designA << ['Click add button', 'P']
designA << ['Locate okay button', 'S']
designA << ['Click okay button', 'P']
content << render(designA)

markdown = md.render(content.join("\n\n"))
template = ERB.new(File.read('template.erb'))
puts template.result