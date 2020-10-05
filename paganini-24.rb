stretch_factor = 140.0/(16*60/(sample_duration :loop_amen_full))
new_length = stretch_factor * (sample_duration :loop_amen_full)

set :continueplay, 1
use_bpm 140
in_thread do
  loop do
    print "loop"
    sample :loop_amen_full, rate: stretch_factor
    sleep 16 # new_length
    cue :the_beat
    stop if get(:continueplay) == 0
  end
end

def play_length note, length
  play note, release: length
  sleep length
end

def rhythm_pattern_1 notes
  play_length notes.shift, 0.50
  sleep 0.25
  
  notes.each do |note|
    play_length note, 0.25
  end
end

def cap_pattern_1 notes
  play_length notes[0], 1.00
  play_length notes[1], 0.50
  sleep 0.5
end


def section1
  bar1
  rhythm_pattern_1 [:E5, :E4, :E4, :Gs4, :Fs4, :E4]
  bar1
  cap_pattern_1 [:E5, :E4]
end

def bar1
  rhythm_pattern_1 [:A4, :A4, :A4, :C5, :B4, :A4]
end

def section2
  rhythm_pattern_1 [:A5, :A5, :A5, :Bf5, :A5, :G5]
  rhythm_pattern_1 [:F5, :D5, :D5, :F5, :E5, :D5]
  rhythm_pattern_1 [:G5, :G5, :G5, :A5, :G5, :F4]
  rhythm_pattern_1 [:E5, :C5, :C5, :E5, :D5, :C5]
  rhythm_pattern_1 [:F5, :B4, :B4, :D5, :C5, :B4]
  rhythm_pattern_1 [:E5, :A4, :A4, :C5, :B4, :A4]
  rhythm_pattern_1 [:F4, :Ds5, :E4, :E5, :D5, :B4]
  cap_pattern_1 [:A4, :A3]
end

def play_theme
  section1
  section1
  section2
end

def rhythm_pattern_2 notes
  notes.shift(3).each do |note|
    play_length note, 0.11
  end
  play_length notes.shift, 0.33
  play_length notes.shift, 0.34
  
  
  notes.shift(2).each do |note|
    play_length note, 0.33
  end
  play_length notes.shift, 0.34
end


def play_variation_1
  2.times do
    rhythm_pattern_2 [:A5, :C6, :E6, :C6, :A5, :E5, :C5, :A4]
    rhythm_pattern_2 [:E5, :Gs5, :B5, :Gs5, :E5, :B4, :Gs4, :E4]
    rhythm_pattern_2 [:A5, :C6, :E6, :C6, :A5, :E5, :C5, :A4]
    cap_pattern_1 [:E5, :E4]
  end
  rhythm_pattern_2 [:Cs6, :E6, :A6, :E6, :Cs6, :A5, :E5, :Cs5]
  rhythm_pattern_2 [:D4, :F4, :A4, :D5, :F5, :A5, :D6, :F6]
  rhythm_pattern_2 [:B5, :D6, :B6, :D6, :B5, :G5, :D5, :B4]
  rhythm_pattern_2 [:C4, :E4, :G4, :C5, :E5, :G5, :C6, :E6]
  rhythm_pattern_2 [:F6, :D6, :B6, :Gs5, :F5, :D5, :B4, :G4]
  rhythm_pattern_2 [:E6, :C6, :A5, :E5, :C5, :A4, :E4, :C4]
  rhythm_pattern_2 [:D4, :F4, :B4, :D5, :F5, :E4, :E5, :Gs4]
  cap_pattern_1 [:A4, :A3]
end

def variation_2_sixteenths_w_grace notes
  notes.shift(4).each do |note|
    play_length note, 0.25
  end
  notes.shift(2).each do |note|
    play_length note, 0.125
  end
  notes.each do |note|
    play_length note, 0.25
  end
end


def variation_2_sixteenths_w_eighths notes
  notes.shift(4).each do |note|
    play_length note, 0.25
  end
  play_length notes.shift, 0.125
  play_length notes.shift, 0.375
  play_length notes.shift, 0.5
end

def variation_2_sixteenths_w_end_cap notes
  notes.shift(6).each do |note|
    play_length note, 0.25
  end
  play_length notes.shift, 0.5
  sleep 0.5
end

def play_variation_2
  2.times do
    variation_2_sixteenths_w_grace [:A4, :Gs4, :A4, :Gs4, :Bf4, :A4, :B4, :C5, :D5]
    variation_2_sixteenths_w_grace [:E5, :Ds5, :E5, :Ds5, :F5, :E5, :D5, :C5, :B4]
    variation_2_sixteenths_w_grace [:A4, :Gs4, :A4, :Gs4, :Bf4, :A4, :B4, :C5, :D5]
    variation_2_sixteenths_w_eighths [:E5, :Ds5, :E5, :Ds5, :F5, :E5, :E4]
  end
  variation_2_sixteenths_w_grace [:A5, :Gs5, :A5, :Gs5, :Bf5, :A5, :G5, :F5, :E5]
  variation_2_sixteenths_w_grace [:D5, :Cs5, :D5, :Cs5, :Ef5, :D5, :E5, :F5, :D5]
  variation_2_sixteenths_w_grace [:G5, :Fs5, :G5, :Fs5, :Af5, :G5, :F5, :E5, :D5]
  variation_2_sixteenths_w_grace [:C5, :B4, :C5, :B4, :Df5, :C5, :D5, :E5, :C5]
  variation_2_sixteenths_w_grace [:F5, :E5, :F5, :E5, :G5, :F5, :D5, :C5, :B4]
  variation_2_sixteenths_w_grace [:E5, :Ds5, :E5, :Ds5, :F5, :E5, :C5, :B4, :A4]
  variation_2_sixteenths_w_grace [:B4, :As4, :B4, :As4, :C5, :B4, :F5, :E5, :Gs4]
  variation_2_sixteenths_w_end_cap [:A4, :Gs4, :A4, :Gs4, :B4, :A4]
end

in_thread do
  sync :variation_2
  with_synth :dpulse do
    2.times do
      play_length :E5, 2
      play_length :G5, 2
      sleep 4.0
    end
    sleep 14.0
    play_length :D4, 2
  end
end


in_thread do
  with_synth :piano do
    play_theme
    sync :the_beat
    play_variation_1
    # cue :variation_2 bad engraving?
    play_variation_2
    set :continueplay, 0
  end
end







