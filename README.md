# Grouping payments app

#### The app will enable users to monitor their payments.

-User can-Sign up, Sign in, Sign out(device gem used, Cloudinary gem used, Picture stored in Cloudinary server)
-User can create a Group while uploading a logo(Cloudinary gem used, Picture stored in Cloudinary server)
-Users can log transactions for any group created.
-User can view all groups(groups index) , where last for transactions for each group is shown(using will_paginate gem)
-User can view each group and all its transactions(using will_paginate gem)
-User can log an external one-off transaction
-User can view all submitted transaction(using will_paginate gem)

##Extra feature
-User can set up a transaction/entity to be defined a recurring transaction 
-A recurring_entity will be created with an entity_id attribute which links to the entity_id
-A repeat attrubute will describe how often the entity/transaction needs to be repeated 


## Built with

- Ruby -v 2.7.2
- Rails -v 6.1.3.1
- SQLite3(in development)
- postgresql(in production)
- VScode
- Lots of love :heart:

## Getting Started

### Prerequisites

To get this project up and running locally, you must already have ruby and the necessary gems installed on your computer

### Installation

In order to run the the project on your local machine, please run the following commands on your terminal:

> 1. run `git clone https://github.com/erezfree29/grouping_payments/`
> 2. run `cd grouping_payments`
> 3. Run bundle install to get the necesary gems.
> 4. Run yarn install.
> 5. Run rails db:create.
> 6. Run rails db:migrate.
> 7.Run Rails S
> 8.Open your browser and navigate to http://localhost:3000/

### Run tests
To test the models run
-rspec spec/models/*.*
To Test the Feature run
rspec spec/feature/*.*

###about the project 
https://www.loom.com/share/74da241d36fd421cb282bb74f23bda5f

###live link
https://groupingapper.herokuapp.com/

 👤 **Erez Friemagor**
 
[<code><img height="26" src="https://cdn.iconscout.com/icon/free/png-256/github-153-675523.png"></code>](https://github.com/erezfree29)
[<code><img height="26" src="https://upload.wikimedia.org/wikipedia/sco/thumb/9/9f/Twitter_bird_logo_2012.svg/1200px-Twitter_bird_logo_2012.svg.png"></code>](https://twitter.com/friemagor?lang=en)
[<code><img height="26" src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Linkedin.svg/1200px-Linkedin.svg.png"></code>](https://www.linkedin.com/in/erez-friemagor/?originalSubdomain=uk)
 <a href="mailto:erezfree29@gmail.com?subject=Hey Erez!"><img height="26" src="https://cdn.worldvectorlogo.com/logos/official-gmail-icon-2020-.svg"></a>

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues](https://github.com/erezfree29/grouping_payments/issues)

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- The Odin Project

## 📝 MIT License

This project makes use of the MIT license.
