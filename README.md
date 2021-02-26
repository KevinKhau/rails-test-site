# Built with

* Ruby version: 3.0.0

* Rails version: 6.1.3, most recent, and because Simplébo is going to use it soon.

* Additional Gem : bcrypt, used for password hashing

# Major difficulties

* While activating JavaScript in application.html.erb, a "Manifest Webpack" error shows up. Have not been able to fix it (yet?).

* Passing data from a controller to another. I stored ticket ID in a session for this, while I expected a TicketController > CommentController data pass.

# Question

* The standard controller actions define '/tickets/:id' with :id as a number. This convention might lack accuracy, doesn't it affect SEO referencing?

* Would it be easy to deviate from the provided base architecture? All controllers are grouped together, while other frameworks such as Angular group by components first. 