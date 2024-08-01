module PrintTextHelper

  def print_text(text, color: :white, weight: :bold)
    text = set_weight(text, weight)
    text = set_color(text, color)
    text
  end

  private

  def set_weight(text, weight)
    case weight
    when :bold
      "\e[1m#{text}\e[1m"
    else
      text
    end
  end

  def set_color(text, color)
    case color
    when :white
      "\e[37m#{text}\e[0m"
    when :cyan
      "\e[36m#{text}\e[0m"
    when :purple
      "\e[35m#{text}\e[0m"
    when :blue
      "\e[34m#{text}\e[0m"
    when :yellow
      "\e[33m#{text}\e[0m"
    when :green
      "\e[32m#{text}\e[0m"
    when :red
      "\e[31m#{text}\e[0m"
    end
  end
end
