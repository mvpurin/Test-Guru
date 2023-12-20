# TestGuru
Ruby on Rails application for testing users in all fields of knowledge 

## Table of Contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Features](#features)
* [Setup](#setup)
* [Usage](#usage)
* [Project status](#project-status)

## General info
It is a Ruby on Rails applications which helps users to create new tests and try to pass them with ability of getting awards in case of success.

## Technologies
Project is created with:
* Ruby version: 2
* Rails version: 6
* Bootstrap version: 4
* PostgreSQL

## Features
* Authentication with Devise gem
* Tests may be time limited

## Setup
To run this project locally, you have to install Ruby and necessary gems on your computer.
Follow these steps:
  1. Clone the project repository: git clone `https://github.com/mvpurin/Test-Guru.git`
  2. Run bundle install to get necessary gems
  3. Run rails `db:drop`
  4. Run rails `db:create`
  5. Run rails `db:migrate`

## Usage
Users can add new tests, badges and timers.

## Project status
Project is in progress. Currently some RSpec tests are adding to the project.
