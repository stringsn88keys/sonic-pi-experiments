stretch_factor = 140.0/(16*60/(sample_duration :loop_amen_full))
new_length = stretch_factor * (sample_duration :loop_amen_full)

in_thread do
  loop do
    
    sample :loop_amen_full, rate: stretch_factor
    sleep new_length
    cue :the_beat
  end
end

def rhythm_pattern_1 notes
  play notes.shift, release: 0.50
  sleep 0.75
  
  notes.each do |note|
    play note, release: 0.25
    sleep 0.25
  end
end

def cap_pattern_1 notes
  play notes[0], release: 1.00
  sleep 1
  play notes[1], release: 0.50
  sleep 1
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
    play note, release: 0.11
    sleep 0.11
  end
  play notes.shift, release: 0.33
  sleep 0.33
  play notes.shift, release: 0.33
  sleep 0.34
  
  notes.shift(2).each do |note|
    play note, release: 0.33
    sleep 0.33
  end
  play notes.shift, release: 0.33
  sleep 0.34
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


in_thread do
  loop do
    use_bpm 140
    with_synth :saw do
      play_theme
      sync :the_beat
      play_variation_1
    end
  end
  sync
end



