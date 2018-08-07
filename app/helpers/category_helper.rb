module CategoryHelper

  @web_development = { name: "web_development",
                       keywords: ["web development", "react", "node.js", "css", "html", "redux", "firebase", "ajax", "flask", "github", "heroku", "deploy", "angular", "rails", "jquery", "jsf", "jsp", "kotlin", "animate", "animation", "payment processing", "web app", "api", "mvc", "node", "nodejs", "bootstrap", "django", "react", "browser", "responsive", "web develop", "chrome", "document object model"]
                     }

  @mobile_apps = {name: "mobile_apps",
                  keywords: ["mobile app", "android", "ios", "swift", "react", "native", "flutter", "redux", "ionic", "xamarin", "firebase", "mobile", "iphone", "google play", "apple store", "app store", "mosh"]
                }

  @programming_languages = { name: "programming_languages",
                             keywords: ["python", "java", "c#", "react", "c++", "spring", "node.js", "tensorflow", "backend", "back-end", "ruby", "angular", "angularjs", "js", "php", "object-oriented", "oop", "scala", "swift", "css", "javascript"]
                           }

  @game_development = { name: "game_development",
                        keywords: ["unity3d", "game development", "3d", "c++", "2d", "animation", "multiplayer", "csharp" ,"c#" , "indie" ]
                      }

  @database = { name: "database",
                keywords: ["sql", "oracle", "database", "mongodb", "queries", "query", "hibernate", "aws", "jdbc", "jpa", "json", "kafka", "laravel", "active record", "activerecord", "spark", "blockchain", "relational", "storage", "dbms"]
              }

  @software_testing = { name: "software_testing",
                        keywords: ["selenium", "appium", "test automation", "debug", "software test"]
                      }

  @software_engineering = { name: "software_engineering",
                            keywords: ["python", "artificial intelligence", "machine learning", "blockchain", "togaf", "object oriented programming", "enterprise", "software architect", "oop", "flask", "alexa", "algorithm", "java", "jenkins", "angular", "angularjs", "linux", "performance computing", "apache", "php", "app development", "mosh", "nlp", "natural language processing"]
                          }

  @development_tools = { name: "development_tools",
                         keywords: ["wordpress", "shopify", "woocommerce", "shop", "dropshipping", "magento", "wix"]
                        }

  @front_end = { name: "front_end",
                 keywords: ["animate", "animation", "cms", "bootstrap", "user interface", "ux", "user experience" "layout", "static", "dynamic", "usability"]
                }

  @dev_ops = { name: "dev_ops",
               keywords:["jenkins", "pipeline", "docker", "kubernetes", "maven", "devops", "continuous integration"]
              }

  @security = { name: "security",
                keywords: ["security", "authentication", "authorization", "hacker", "oauth2", "encrypt", "vulnerab"]
              }

  @data_analysis = { name: "data_analysis",
                     keywords: ["data flow", "diagram", "excel", "data analysis", " r ", "matlab", "math", "hadoop", "tableau", "statistic", "data science", "data analysis",  "big data"]
                   }

  @blockchain = { name: "software_testing",
                  keywords: ["blockchain" ,"solidity", "ethereum", "crypto"]
                }
  @all_categories = [@web_development, @mobile_apps, @programming_languages, @game_development, @database, @software_testing, @software_engineering, @development_tools, @front_end, @dev_ops, @security, @data_analysis, @blockchain]

  def self.call(string)
    string = string.downcase
    all_categories = []
    @all_categories.each do |h|
      h[:keywords].each do |keyword|
        p "trigger keyword #{keyword} -> #{h[:name]}" if string.include?(keyword)
        all_categories << h[:name] if string.include?(keyword)
        next
      end
    end
    return all_categories.uniq
  end

  def self.categories
    category_hash = category_with_count
    @top_categories_count = category_hash.sort_by { |a| -a[1][2] }[0..3]
    @categories = (category_hash.to_a - @top_categories_count.to_a).to_h
  end

  def self.top_categories
    category_hash = category_with_count
    # top four categories based on course count
    @top_categories_count = category_hash.sort_by { |a| -a[1][2] }[0..3]
  end

  private
  def self.category_with_count
    category_hash = {
      "web_development" => ["Web Development", "category_images/web_development.jpeg"],
      "mobile_apps" => ["Mobile Apps", "category_images/mobile_apps.jpeg"],
      "programming_languages" => ["Programming Languages", "category_images/programming_languages.jpg"],
      "game_development" => ["Game Development","category_images/game_development.jpeg"],
      "database" => ["Databases","category_images/databases.jpeg"],
      "software_testing" => ["Software Testing", "category_images/software_testing.jpeg"],
      "software_engineering" => ["Software Engineering", "category_images/software_engineering.jpeg"],
      "development_tools" => ["Development Tools", "category_images/development_tools.jpeg"],
      "front_end" => ["Front-end & Design", "category_images/front-end_design.png"],
      "Dev_ops" => ["DevOps","category_images/devops.jpeg"],
      "security" => ["Security", "category_images/security.jpeg"],
      "data_analysis" => ["Data Analysis", "category_images/data_analysis.jpeg"],
    }

    category_hash.each do |category, array|
      array << category_course_count(category)
    end
  end


  def self.category_course_count(category)
    courses_in_category = Course.where("categories->'categories' ? :value", value: "#{category}")
    return courses_in_category.count
  end

  def self.top_categories_on_count(category_hash)
   category_hash.sort_by { |a| a[2] }[0..3]
  end
end
