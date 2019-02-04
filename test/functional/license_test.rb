require 'functional/helper'

# File.join(ENV['HOME'], '.chef', 'accepted_licenses')

describe 'The license acceptance mechanism' do
  describe 'when the license has not been accepted' do

    describe 'when the user passes the --accept-license flag' do
    end

    describe 'when the user answers yes to the challenge' do
    end

    describe 'when the user answers no to the challenge' do
    end

    describe 'when a command is used that should not be gated on licensure' do
    end

   end

  describe 'when the license has already been accepted' do
    describe 'when the license was accepted by touching a blank file' do
    end

    describe 'when the license persistance file is a YAML file' do
    end
  end
