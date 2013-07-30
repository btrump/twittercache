twittercache
=================

Enter information from Twitter developer applications to create a search server with custom weighted search terms.  Results store all information about tweets, and create/update user(s) who posted tweet.  Results accessible via API (tastypie).

Objects:
* [Tweets](https://dev.twitter.com/docs/platform-objects/tweet "Tweets")
* [Users](https://dev.twitter.com/docs/platform-objects/users "Users")
* [Coordinates](https://dev.twitter.com/docs/platform-objects/tweets#obj-coordinates "Coordinates") 

Next steps:
1. cron job to automate searches
2. Add API for accessing results

Known problems:
* Non-null coordinates cause error
* Bytestring in tweet ‘text’ field cannote be properly decoded and inserted into database.  Example of offending tweet:
> Have a good day @jazz_da_fantazz 😊
