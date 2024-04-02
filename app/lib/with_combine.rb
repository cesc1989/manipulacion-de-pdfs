class WithCombine
  def generate
    final_pdf = CombinePDF.new
    final_pdf << CombinePDF.load("./storage/00.combine.pdf")
    final_pdf << CombinePDF.load("./storage/01.combine.pdf")
    final_pdf << CombinePDF.load("./storage/02.combine.pdf")

    final_pdf.save("./storage/prueba_combine.pdf")
  end
end
