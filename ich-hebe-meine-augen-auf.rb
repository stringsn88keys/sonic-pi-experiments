# Welcome to Sonic Pi

use_bpm 140

def play_length note, length
  play note, release: length unless note.nil?
  sleep length
end

@opening_motif=[:a4, :d5, :e5, :f5, :d5, :f5, :g5, :a5]
@opening_motif_rhythm=[4,3,1,1,1,1,1,4]
@opening_motif_rhythm_alt=[2,3,1,1,1,1,1,4]

@second_motif=[nil, :f5, :f5, :e5, :d5, :c5, :b4, :a4, :b4, :c5, :f4, :bb4, :c5, :d5, :a4, :a4]
@second_motif_rhythm=[1,1,1,1,3,0.5,0.5,1,1,1,1,1.5,0.5,4,2,2]

@second_motif_alt1=[nil, :f4, :f4, :e4, :d4, :c4, :b3, :a3, :d4, :a4, :d4, :a4]
@second_motif_alt1_rhythm=[1,1,1,1,3,0.5,0.5,2,2,2,2,4]

@second_motif_alt2=[nil, :f4, :f4, :e4, :d4, :c4, :b3, :a3, :b3, :c4, :f3, :bb3, :c4, :d4, :g3, :a3]
@second_motif_alt2_rhythm=[1,1,1,1,3,0.5,0.5,1,1,1,1,1,1,4,2,2]

@third_motif_sopran1=%i[f5 f5 e5 d5 c5 d5 e5 c5 f5 d5 c5 a4 a4 b4 c5 d5]
@third_motif_sopran1_rhythm=[2,3,0.5,0.5,0.5,0.5,0.5,0.5,1,1,1,1,1,0.5,0.5,4]

@third_motif_sopran2=%i[f5 f5 e5 d5 c5 d5 e5 a5 g5 g5 f5 g5 e5]
@third_motif_sopran2_rhythm=[2,3,0.5,0.5,1,1,1,1,1,1,4,2,4]

@third_motif_alt1=%i[g4 g4 c5 bb4 a4 a4 bb4 a4 e4 a4 b4 c5 a4 b4 c5 d5]
@third_motif_alt1_rhythm=[1,1,1,2,2,2,2,2,2,3,1,1,1,1,1,4]

@third_motif_alt2=%i[d4 a4 g4 f4 d4 f4 g4 a4 a3 a3 g3 a3 bb3 c4 d4 d4]
@third_motif_alt2_rhythm=[4,2,2,1,1,1,1,2,1,1,0.5,0.5,0.5,0.5,2,2]

def play_with_rhythm(notes, rhythm)
  notes.zip(rhythm).each do |pair|
    play_length pair[0], pair[1]
  end
end


def octave_adjust(notes, octaves)
  notes.map do |note|
    [note[0..-2],(note[-1].to_i-1).to_s].join.to_sym
  end
end

def sopran1
  in_thread do
    play_with_rhythm(@opening_motif, @opening_motif_rhythm) # end of measure 2
    play_with_rhythm(@second_motif, @second_motif_rhythm) # fourth beat of measure 5
    sleep 4
    play_with_rhythm(@third_motif_sopran1, @third_motif_sopran1_rhythm) # third beat of measure 8
  end
end


def sopran2
  in_thread do
    sleep 8 + 6
    play_with_rhythm(@opening_motif, @opening_motif_rhythm_alt) # third beat of measure 4
    play_with_rhythm(@second_motif, @second_motif_rhythm) #  second beat of measure 7
    sleep 4
    play_with_rhythm(@third_motif_sopran2, @third_motif_sopran2_rhythm) # third beat of measure 10
  end
end

def alt1
  in_thread do
    sleep (3*8)+2
    play_with_rhythm(octave_adjust(@opening_motif,-1), @opening_motif_rhythm_alt) # end of measure 5
    play_with_rhythm(@second_motif_alt1, @second_motif_alt1_rhythm) # third beat of measure 8
    sleep 1
    play_with_rhythm(@third_motif_alt1, @third_motif_alt1_rhythm) # end of measure 11
  end
end

def alt2
  in_thread do
    sleep (4*8)+6
    play_with_rhythm(octave_adjust(@opening_motif,-1), @opening_motif_rhythm_alt) # third beat of measure 7
    play_with_rhythm(@second_motif_alt2, @second_motif_alt2_rhythm) # second beat of measure 10
    sleep 2
    play_with_rhythm(@third_motif_alt2, @third_motif_alt2_rhythm) # second beat of measure 13
  end
end

with_synth :tri do
  sopran1
  sopran2
  alt1
  alt2
end
