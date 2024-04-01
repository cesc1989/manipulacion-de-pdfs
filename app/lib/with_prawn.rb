class WithPrawn
  def initialize
    @pdf = Prawn::Document.new
    @file_path = Rails.root.join('storage')
  end

  def generate
    @pdf.font_size(18)
    @pdf.text('Hola!')

    @pdf.font_size(16)
    @pdf.text('Soy un PDF con Prawn')

    @pdf.move_down(10)

    @pdf.font_size(12)
    @pdf.text("Pushed the mug off the table howl on top of tall thing. Prow?? ew dog you drink from the toilet, yum yum warm milk hotter pls, ouch too hot catty ipsum, lick arm hair. See owner, run in terror humans,humans, humans oh how much they love us felines we are the center of attention they feed, they clean chew iPad power cord, for run as fast as i can into another room for no reason, lick butt, or bathe private parts with tongue then lick owner's face.")

    @pdf.move_down(10)
    @pdf.text("Pee in human's bed until he cleans the litter box bite off human's toes so licks your face but chase after silly colored fish toys around the house i show my fluffy belly but it's a trap! if you pet it i will tear up your hand yet lie in the sink all day adventure always.")

    @pdf.render_file("#{@file_path}/prueba_prawn.pdf")
  end
end
