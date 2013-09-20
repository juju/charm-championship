![Juju](http://ubuntuone.com/5mLQLCHY50wB2OyqejDpRa)

Everyone needs infrastructure, leverage the power of Juju to do it in an interesting way and win a prize.

---

## What is it?

- Charm up the individual services in your infrastructure, make something that is cool and repeatable. 
- Put it together into a Juju bundle.
- Submit your stack for the prize.
- Win money, over $60,000 USD in prizes! 


## This contest is for software developers.

### Step 1 - [Read the rules](http://juju.ubuntu.com/charm-championship).

### Step 2 - Grab [the charms you](http://jujucharms.com) need for your stack or write your own and submit them back to the community. 

### Step 3 - Design and implement your infrastructure in the [Juju GUI](http://jujucharms.com/charms/precise/juju-gui), then export it.

### Step 4 - [Register](https://pages.canonical.com/CharmChamshionship_sign-up.html) so we can keep you updated and contact you if you're a finalist. 

### Step 5 - Submit your deployment bundle by forking this project and submitting a pull request.

---

## Prizes

- $10,000 USD prize for each category:
  - In addition, individual charm maintainers of a reviewed charm in the “reviewed” section of the Charm Store receive $200 if their charm is included in a winning template. This can be awarded multiple times, to a maximum total of $3,000 per category.</li>

- Winners in six categories
  - Continuous deployment - a bundle of charms that allows startups to be immediately productive, continually launch new features, and scale effortlessly.
  - Media - a bundle of charms that brings value to media content providers, distributors, and associated mass medium technologies.
  - Telco - a bundle of charms that brings value to telecommunications service providers and telecommunications infrastructure.
  - High Availability - represents a full stack of HA-enabled services to accomplish a task.
  - Data Science / Data Mining - represents a full stack of data mining and “big data” analysis.
  - Monitoring - represents a full stack of monitoring solutions for existing services.

- Joint marketing opportunities with Canonical 

## Rules

See [this page](https://juju.ubuntu.com/charm-championship) for a complete list of rules. Legal document included in the github branch you will clone to enter. 


---

## Timeline

- July 1 - October 22

## FAQ

### Q: Who should participate?

Anyone who has an infrastucture stack in the cloud and is interested in managing complex services. 

### Q: Where can I ask questions and discuss the prizes?

A: There is a mailing list for it [here](https://lists.ubuntu.com/mailman/listinfo/juju).


### Q: How do I actually contribute?

A: See [this page](https://juju.ubuntu.com/charm-championship) with the step by step. But basically, model your stack in the Juju GUI, export it, and submit the yaml file via github.

Export your bundle from the Juju GUI by hitting “Shift-D”. This will download a YAML file, which is your _submission_ to the contest. To import/re-deploy your bundle use the Juju Deployer if you want to test it on other environments:

    sudo pip install juju-deployer
    juju bootstrap
    juju-deployer -c your-gui-export.yaml

We recommend testing your bundle before submission, judges can't judge non-working bundles! 


### Q: Aren’t you just doing this to get a bunch of free work?

A: NO! The charms in the Charm Store are Free Software. We want people to improve knowledge sharing between devops. Keep your secret sauce secret, we want to concentrate on improving the blocks people use to build their infrastructure. 


This contest is inspired by our friends at [Netflix](https://github.com/Netflix/Cloud-Prize).
