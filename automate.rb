
def check_number(n, c)
  c.to_i.to_s == c ? n += c : n
end

def get_child_pid(s)
  s.each_char.reduce("") do |n, c| 
    return n if c == ","
    check_number(n, c)
  end
end

def parse
  hash = Hash.new {|h, k| h[k] = []}
  "0
I am a parent and my PID is 13091
I am a child and my PID is 13093, my father's PID is:13091
I am a child and my PID is 13094, my father's PID is:13091
1
I am a parent and my PID is 13091
I am a child and my PID is 13096, my father's PID is:13091
I am a child and my PID is 13097, my father's PID is:13091
2
I am a parent and my PID is 13091
I am a child and my PID is 13099, my father's PID is:13091
I am a child and my PID is 13100, my father's PID is:13091
I am a child and my PID is 13101, my father's PID is:13091
3
I am a parent and my PID is 13091
4
I am a parent and my PID is 13091
5
I am a parent and my PID is 13091
6
I am a parent and my PID is 13091
I am a child and my PID is 13106, my father's PID is:13091
7
I am a parent and my PID is 13091
8
I am a parent and my PID is 13091".split("\n").each do |s| 
    if s.start_with?("I am a child") 
      hash[s.split(" ").last.each_char.reduce("") {|n, c| check_number(n, c)}] << get_child_pid(s)
    end
  end
  hash
end

def details
  hash = parse
  hash.each do |k, v|
    puts "#{k} HAS #{hash[k].length} CHILDREN"
    print "#{v}\n" 
  end
end

details
