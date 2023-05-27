require 'date'

class Emprunt
  attr_accessor :montant, :duree, :date_debut

  MOIS = %w[Jan Fév Mar Avr Mai Jun Jul Aoû Sep Oct Nov Déc] # Noms des mois en français

  def initialize(montant, duree, date_debut)
    @montant = montant
    @duree = duree * 12 # Convertir la durée en années en mois
    @date_debut = Date.strptime(date_debut, '%d/%m/%Y') # Convertir la chaîne en date
  end

  def paiement_mensuel
    @montant / @duree
  end

  def generate_output
    output = ""
    output += "***************************************************\n"
    output += "Date: #{@date_debut}\n"
    output += "Montant du prêt: #{@montant}\n"
    output += "Durée du prêt: #{@duree/12} ans\n"
    output += "Paiement mensuel: #{paiement_mensuel.round(2)}€\n"
    output += "***************************************************\n"
    output += "Date du paiement - Paiement mensuel - Solde restant\n"
    output += "***************************************************\n"
    output += echeancier
    output += "***************************************************\n"
    output += "Fait le:              à              ;\n"
    output += "\n"
    output += "Signatures:\n"
    output += "\n"
    output += "\n"
    output += "\n"
    output += "\n"
    output += "***************************************************\n"
    output
  end

  def echeancier
    solde_restant = @montant
    date_paiement = @date_debut
    echeancier_text = ""
    @duree.times do |i|
      paiement = paiement_mensuel
      solde_restant -= paiement
      # format for cmdline display
      date_format = "#{date_paiement.day} #{MOIS[date_paiement.month-1]} #{date_paiement.year}"
      paiement_format = "#{paiement.round(2)}€"
      solde_restant_format = "#{solde_restant.round(2)}€"
      echeancier_text += "#{date_format.center(18)} #{paiement_format.center(18)} #{solde_restant_format.center(14)}\n"
      date_paiement = date_paiement >> 1 # ajouter un mois à la date
    end
    echeancier_text
  end
end



puts "Entrer le montant du prêt:"
montant = gets.chomp.to_f
puts "Entrer la durée du prêt (en années):"
duree = gets.chomp.to_i
puts "Entrer la date de début du prêt (jj/mm/aaaa):"
date_debut = gets.chomp

emprunt = Emprunt.new(montant, duree, date_debut)

File.open('echeancier.txt', 'w') do |f|
    f.write(emprunt.generate_output)
end
