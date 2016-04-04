Portfolioz
==========

When complete, this application allows one to create investment portfolios across brokerages and accounts, uncoupling *where* an asset is located from *which* portfolio it belongs to.

---------------------

This is a "scratch your own itch" project I started in February, 2015 and have worked on now and then. The problem is one I'm sure many have: I have several portfolios of investments ("Retirement", "Speculation", "For Bad Times"), but each is not neatly separated by being contained in one account or even in multiple accounts at one broker. I want an application that knows where all the assets are, but allows me to construct and track portfolios that consist of assets from any location. I also want to keep track of where a recommendation for each purchase came from, and eventually, to implement trailing stop notifications.

So far I have created a set of models for transactions, trades, and other data, and have tests for the transactions and trades. Notable is that the transaction and trade models are true OOP, with a logical hierarchy. For example, a Buy is a Trade, which is a Transaction. Each subclass inherits methods from its superclass and adds some more.

Also notable is that I have indulged in a bit of possible premature optimization by implementing basic account financial computations using the SUM method of the SQL database. I don't regard this as premature, however, because it greatly simplifies the code; possible additional speed is simply a side benefit.
