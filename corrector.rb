class Corrector
  def correct_name(name)
    name.gsub(name[0], name[0].upcase)[0, 10]
  end
end
