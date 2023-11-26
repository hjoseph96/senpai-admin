# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js", preload: true
pin 'Splide', to: '@splidejs/splide'
pin_all_from "app/javascript/controllers", under: "controllers"
