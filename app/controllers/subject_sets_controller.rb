# -*- encoding : utf-8 -*-
class SubjectSetsController < ApplicationController


def new
  @subject_set = SubjectSet.new
end

def show
  @subject_set = SubjectSet.find(params[:id])
    a = ["COMM", "AOO7", "AOO1", "AOO2", "AOO5", "AOO3", "AOO6", "AOO4", "BON", "BIOS5", "BIOS1", "BIOS2", "BIOS3", "BIOS4", "BONE1", "BONE2", "BONE3", "BONE4", "BONE5", "BC1", "BC2", "BC3", "BC4", "BC5", "BC6", "BC7", "BC8", "CRC1", "GDLN1", "GDLN2", "DXST1", "DXST2", "DXST3", "DIAG", "ENDO1", "ENDO2", "ENDO3", "ENDO4", "ENDO5", "ENDO6", "ENDO7", "EPID5", "EPID1", "EPID2", "EPID3", "EPID4", "FTED", "GIC1", "GIC2", "GIC3", "GIC4", "GIC5", "GIC6", "GIC7", "GIC8", "GIC9", "GIC10", "GIC11", "GIC12", "GIC13", "GIC14", "GIC15", "GIC16", "GIC17", "GIC18", "GIC19", "GIC20", "GIC21", "GIC22", "GIC23", "GIC24", "GIC25", "GIC26", "GIC27", "GIC28", "GIC29", "GIC30", "GIC31", "GIC32", "GIC33", "GIC34", "GIC35", "GIC36", "GIC37", "GIC38", "GIC39", "GIC40", "GIC41", "GIC42", "GUC1", "GUC2", "GUC3", "GUC4", "GUC5", "GUC6", "GUC7", "GUC8", "GUC9", "GUC10", "GUC11", "GUC12", "GUC13", "GUC14", "GUC15", "GUC16", "GUC17", "GUC18", "GUC19", "GUC20", "GUC21", "GYNC1", "GYNC2", "GYNC3", "GYNC4", "GYNC5", "GYNC6", "GYNC7", "GYNC8", "GYNC9", "GYNC10", "GYNC11", "GYNC12", "GYNC13", "GYNC14", "GYNC15", "GYNC16", "GYNC17", "GYNC18", "GYNC19", "GYNC20", "GYNC21", "HNC1", "HNC2", "HNC3", "HNC4", "HNC5", "HNC6", "HNC7", "HNC8", "HNC9", "HNC10", "HNC11", "HNC12", "HNC13", "HNC14", "HNC15", "HSR1", "HSR2", "HSR3", "HSR4", "HEMA3", "HEMA4", "HEMA5", "HEMA6", "HEMA7", "HEMA8", "HEMA9", "HEMA10", "HEMA11", "HEMA12", "HEMA13", "HEMA14", "HEMA15", "HEMA16", "HEMA17", "HEMA18", "HEMA19", "HEMA20", "HEMA21", "HEMA22", "HEMA23", "HEMA24", "HEMA25", "CHINA", "CZECH", "FRA", "GER", "HUNG", "ITA", "POL", "ROM", "RUS", "ESP", "TURK", "MELA1", "MELA2", "MELA3", "MELA4", "MELA5", "MELA6", "MELA7", "NEUR1", "NEUR2", "NEUR3", "NEUR4", "NEUR5", "NEUR6", "NEUR7", "NEUR8", "NMEL", "JCOED", "OGR", "PSC2", "PSC3", "PSC4", "PSC5", "PSC6", "PSC7", "PSC8", "PSC9", "PSC10", "PSC12", "PSC13", "PSC14", "PSC15", "PEDI2", "PEDI3", "PEDI4", "PEDI5", "PEDI6", "PEDI7", "PEDI8", "PEDI9", "PEDI10", "PEDI11", "PEDI12", "PEDI13", "PEDI14", "PEDI15", "PEDI16", "PEDI17", "PEDI18", "PEDI19", "PEDI20", "PEDI21", "PEDI22", "PEDI23", "PEDI24", "PEDI25", "FAZE", "RADN", "SARC1", "SARC2", "SARC3", "SARC4", "SARC5", "SARC6", "SARC7", "SARC8", "SARC9", "SARC10", "SARC11", "SARC12", "SARC13", "SARC14", "SARC15", "SARC16", "STAT", "SURG", "THOR1", "THOR2", "THOR3", "THOR4", "THOR5", "THOR6", "THOR7", "THOR8", "THOR9", "THOR10", "THOR11", "THOR12", "THOR13", "THOR14", "THOR15", "THOR16", "THOR17", "THOR18", "THOR19", "TO1", "TO2", "TO3", "TO4", "TO5", "TO6", "TO7", "TO8", "TO9", "TO10", "TO11", "TO13", "TO26", "TO14", "TO15", "TO16", "TO17", "TO18", "TO19", "TO20", "TO21", "TO22", "TO23", "TO24", "TO25", "CMPL1", "CMPL2", "CMPL3", "CMPL4", "CMPL5", "CMPL6", "TIMG6", "TIMG3", "TIMG8", "TIMG7", "TIMG4", "TIMG5", "TIMG1", "TIMG2", "UTP", "RARE"]#@subject_set.changeInput
    #@subject_set.save 
    t = @subject_set.subject_codes
    y = t.gsub(/\w{2}\.\w{4}\/\w{3}\.\w{4}\.\w{2}\.\w{4}+/, '').split(/[\s,]/).uniq.reject! { |c| c.empty? }
      if y.all? { |e| a.include?(e) }
        flash[:notice] = "Your subject codes are all correct!"
      else
        flash[:notice] = "One of the codes you entered does not match the JCO subject codes." 
      end
end

def create
  @subject_set = SubjectSet.new(params[:subject_set])
    if @subject_set.save
        redirect_to @subject_set
    else
        format.html { render action: "new" }
        format.json { render json: @subject_set.errors, status: :unprocessable_entity }
    end
end


end
