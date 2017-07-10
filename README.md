# Knowledge Management System

Ruby on Rails application build by passionate engineers. It supports knowledge managements and hepls to organize articles.


### System Requirements:

* Ruby-2.3.0
* Rails 5.0.0.1

Rules of the Road

### Setup 

  1. Get the code.

    % git clone https://github.com/charusat09/kms.git

  2. Setup your environment.

    % bin/setup

  3. Start Rails Server

    % bin/rails server
    
  4. Verify that the app is up and running.

    % open http://localhost:3000

### Protocol

  1. Make sure the master branch is up-to-date.

    % git checkout master  
    % git pull origin master  

  2. Create a feature branch off master.

    % git checkout -b <branch-name>  
  
  3. Create work-in-progress commits (as needed).

    % git commit -m "WIP Update user email"

  4. Regularly update your feature branch using rebase against master. Use caution when resolving merge conflicts.

    % git rebase master

  5. When the feature is complete and the tests pass, share your branch.

    % git push origin <branch-name>
  
  6. Submit a GitHub pull request against the master branch.

  7. A team member other than the author reviews the pull request.

  8. When satisfied, they comment on the pull request "Ready to merge".

  9. Rebase interactively. Squash commits like "Fix whitespace" into one valuable commit. Edit commit message to reveal intent.

    % git rebase -i master  
    % git push origin --force <branch-name>  
  
  10. An administrator will sign off and Merge the branch into staging.

    % git checkout master  
    % git merge <branch-name>  
  
  11. Delete your remote feature branch.

  12. Delete your local feature branch.

    % git branch -d <branch-name>



### Test Suite

  1.How to run the test suite
    
    # TODO

### Deployment

    # TODO
  
### License

  MIT License. Copyright 2016.

