class CategoryLabeling

  def self.call

      @stop = ["free", "easy", "online","y","creating", "advanced", "skills", "features", "understanding", "real", "write", "www", "href", "https", "students", "understand", "work", "concepts", "start", "time", "computer", "basic", "basics", "tools", "business", "-","big","redactor-inline-converted","en", "de","great", "de", "learn", "mit", "today","u","a", "em", "ll", "br", "about", "above", "after", "again", "against", "all", "am", "an", "and", "any", "are", "aren't", "as", "at", "be", "because", "been", "before", "being", "below", "between", "both", "but", "by", "can't", "cannot", "could", "couldn't", "did", "didn't", "do", "does", "doesn't", "doing", "don't", "down", "during", "each", "few", "for", "from", "further", "had", "hadn't", "has", "hasn't", "have", "haven't", "having", "he", "he'd", "he'll", "he's", "her", "here", "here's", "hers", "herself", "him", "himself", "his", "how", "how's", "i", "i'd", "i'll", "i'm", "i've", "if", "in", "into", "is", "isn't", "it", "it's", "its", "itself", "let's", "me", "more", "most", "mustn't", "my", "myself", "no", "nor", "not", "of", "off", "on", "once", "only", "or", "other", "ought", "our", "ours", "ourselves", "out", "over", "own", "same", "shan't", "she", "she'd", "she'll", "she's", "should", "shouldn't", "so", "some", "such", "than", "that", "that's", "the", "their", "theirs", "them", "themselves", "then", "there", "there's", "these", "they", "they'd", "they'll", "they're", "they've", "this", "those", "through", "to", "too", "under", "until", "up", "very", "was", "wasn't", "we", "we'd", "we'll", "we're", "we've", "were", "weren't", "what", "what's", "when", "when's", "where", "where's", "which", "while", "who", "who's", "whom", "why", "why's", "with", "won't", "would", "wouldn't", "you", "you'd", "you'll", "you're", "you've", "your", "yours", "yourself", "yourselves", "thus", "co", "together", "across", "toward", "afterwards", "last", "towards", "eg", "latter", "per", "either", "latterly", "perhaps", "else", "least", "rather", "almost", "elsewhere", "less", "upon", "alone", "enough", "ltd", "seem", "us", "along", "etc", "many", "seemed", "already", "even", "may", "seeming", "via", "also", "ever", "seems", "although", "every", "meanwhile", "several", "always", "everyone", "might", "well", "among", "everything", "amongst", "everywhere", "moreover", "since", "except", "whatever", "mostly", "another", "first", "much", "somehow", "whence", "must", "someone", "whenever", "anyhow", "former", "something", "anyone", "formerly", "sometime", "whereafter", "anything", "namely", "sometimes", "whereas", "anywhere", "neither", "somewhere", "whereby", "never", "still", "wherein", "around", "nevertheless", "whereupon", "next", "wherever", "whether", "hence", "nobody", "whither", "became", "none", "noone", "become", "hereafter", "becomes", "hereby", "whoever", "becoming", "herein", "nothing", "thence", "whole", "hereupon", "now", "nowhere", "thereafter", "whose", "beforehand", "thereby", "behind", "therefore", "will", "often", "therein", "thereupon", "within", "beside", "without", "besides", "however", "one", "yet", "beyond", "ie", "onto", "though", "inc", "others", "throughout", "can", "indeed", "otherwise", "thru", "p", "div", "h1", "h2", "h3", "li", "ul", "strong", "a's", "able", "according", "accordingly", "actually", "ain't", "allow", "allows", "anybody", "anyway", "anyways", "apart", "appear", "appreciate", "appropriate", "aside", "ask", "asking", "associated", "available", "away", "awfully", "believe", "best", "better", "brief", "c'mon", "c's", "came", "cant", "cause", "causes", "certain", "certainly", "changes", "clearly", "com", "come", "comes", "concerning", "consequently", "consider", "considering", "contain", "containing", "contains", "corresponding", "course", "currently", "definitely", "described", "despite", "different", "done", "downwards", "edu", "eight", "entirely", "especially", "et", "everybody", "ex", "exactly", "example", "far", "fifth", "five", "followed", "following", "follows", "forth", "four", "furthermore", "get", "gets", "getting", "given", "gives", "go", "goes", "going", "gone", "got", "gotten", "greetings", "happens", "hardly", "hello", "help", "hi", "hither", "hopefully", "howbeit", "ignored", "immediate", "inasmuch", "indicate", "indicated", "indicates", "inner", "insofar", "instead", "inward", "it'd", "it'll", "just", "keep", "keeps", "kept", "know", "known", "knows", "lately", "later", "lest", "let", "like", "liked", "likely", "little", "look", "looking", "looks", "mainly", "maybe", "mean", "merely", "name", "nd", "near", "nearly", "necessary", "need", "needs", "new", "nine", "non", "normally", "novel", "obviously", "oh", "ok", "okay", "old", "ones", "outside", "overall", "particular", "particularly", "placed", "please", "plus", "possible", "presumably", "probably", "provides", "que", "quite", "qv", "rd", "re", "really", "reasonably", "regarding", "regardless", "regards", "relatively", "respectively", "right", "said", "saw", "say", "saying", "says", "second", "secondly", "see", "seeing", "seen", "self", "selves", "sensible", "sent", "serious", "seriously", "seven", "shall", "six", "somebody", "somewhat", "soon", "sorry", "specified", "specify", "specifying", "sub", "sup", "sure", "t's", "take", "taken", "tell", "tends", "th", "thank", "thanks", "thanx", "thats", "theres", "think", "third", "thorough", "thoroughly", "three", "took", "tried", "tries", "truly", "try", "trying", "twice", "two", "un", "unfortunately", "unless", "unlikely", "unto", "use", "used", "useful", "uses", "using", "usually", "value", "various", "viz", "vs", "want", "wants", "way", "welcome", "went", "willing", "wish", "wonder", "yes", "zero", "abst", "accordance", "act", "added", "adj", "affected", "affecting", "affects", "ah", "announce", "anymore", "apparently", "approximately", "aren", "arent", "arise", "auth", "b", "back", "begin", "beginning", "beginnings", "begins", "biol", "briefly", "c", "ca", "couldnt", "d", "date", "due", "e", "ed", "effect", "eighty", "end", "ending", "et-al", "f", "ff", "fix", "found", "g", "gave", "give", "giving", "h", "hed", "heres", "hes", "hid", "home", "hundred", "id", "im", "immediately", "importance", "important", "index", "information", "invention", "itd", "j", "k", "kg", "km", "l", "largely", "lets", "line", "'ll", "m", "made", "make", "makes", "means", "meantime", "mg", "million", "miss", "ml", "mr", "mrs", "mug", "n", "na", "nay", "necessarily", "ninety", "nonetheless", "nos", "noted", "o", "obtain", "obtained", "omitted", "ord", "owing", "page", "pages", "part", "past", "poorly", "possibly", "potentially", "pp", "predominantly", "present", "previously", "primarily", "promptly", "proud", "put", "q", "quickly", "r", "ran", "readily", "recent", "recently", "ref", "refs", "related", "research", "resulted", "resulting", "results", "run", "s", "sec", "section", "shed", "shes", "show", "showed", "shown", "showns", "shows", "significant", "significantly", "similar", "similarly", "slightly", "somethan", "specifically", "stop", "strongly", "substantially", "successfully", "sufficiently", "suggest"]

      all_courses = Course.all
      array_descriptions= []
      all_courses.each do |i|
        array_descriptions << i.description
      end

      all_as_string = array_descriptions.join("")
      tokeniser = WordsCounted::Tokeniser.new(all_as_string).tokenise(exclude: @stop)
      stripped_array = tokeniser.join(" ")

      counter = WordsCounted.count(
        stripped_array
      )


      p counter.token_count
      p counter.token_frequency

  end
end


