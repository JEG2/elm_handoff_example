namespace :elm do
  desc "Compile Elm"
  task :compile do
    Dir.chdir("elm") do
      sh "elm-make ElmBridge.elm --output ../public/javascripts/ElmBridge.js"
    end
  end
end
