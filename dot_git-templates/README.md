# git-templates

## Intro

Makes lives easier by enforcing a commit message standard

## Installation

```
git clone git@github.com:gethopi/git-templates.git ~/.git-templates
git config --global init.templatedir '~/.git-templates'
```

And then `git init .` inside pre-existing repositories on your local machine

## Usage

To enforce commit message hooks on pre-existing repositories you can simply run the command below.

```
git init .
```

## Description

### Commit messages

This how we use the commit message prefixes

- `feat` if it adds a new thing to the environment that was not there before or changes functionality in a planned way (not because of a bug)
- `fix` if it changes an unintended behaviour (because of a bug) or setting in the environment or if it corrects something that prevents from running (syntax error)
- `chore` if it is a planned modification of something in the environment that does not change functionality (for example modifying the number of instances in a scaling group or updating a dns name)
- `refactor` if the change is purely structural and doesn't modify the running environment
- `style` if the change is just changing indentation or reformatting a file
- `docs` if it is a change in the documentation (for example this file)


https://www.conventionalcommits.org/en/v1.0.0/


```
/*
Example commit messages

+ 61c8ca9 fix: navbar not responsive on mobile
+ 479c48b test: prepared test cases for user authentication
+ a992020 chore: moved to semantic versioning
+ b818120 fix: button click even handler firing twice
+ c6e9a97 fix: login page css
+ dfdc715 feat(auth): added social login using twitter

*/
```



