stretch_factor = 140.0/(16*60/(sample_duration :loop_amen_full))
new_length = stretch_factor * (sample_duration :loop_amen_full)

in_thread do
  loop do
    
    sample :loop_amen_full, rate: stretch_factor
    sleep new_length
  end
end

def rhythm_pattern_1 notes=[]
  play notes.shift, release: 0.5
  sleep 0.75
  
  notes.each do |note|
    play note, release: 0.25
    sleep 0.25
  end
end

def cap_pattern_1 notes
  play notes[0], release: 1.0
  sleep 1
  play notes[1], release: 0.5
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


in_thread do
  loop do
    use_bpm 140
    with_synth :saw do
      section1
      section2
    end
  end
  sync
end



