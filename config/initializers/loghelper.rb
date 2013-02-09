class ActiveSupport::BufferedLogger

  def log(message)
    output = "#{caller.at(1).sub(%r{.*/},'').sub(%r{:in\s.*},'')}"
    output += "\n- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n"
    output += message
    output += "\n. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .\n"
    debug output
  end

end