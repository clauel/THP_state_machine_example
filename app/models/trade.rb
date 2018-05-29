class Trade < ApplicationRecord
  include AASM

  scope :pending,    -> { where aasm_state: 'pending' }
  scope :processing, -> { where aasm_state: 'processing' }
  scope :executed,   -> { where aasm_state: 'executed' }

  aasm do
    state :pending, :initial => true
    state :processing
    state :executed
    state :closed
    state :failed

    event :start_processing do
      transitions :from => :pending, :to => :processing
    end

    event :mark_as_executed do
      transitions :from => :processing, :to => :executed
    end

    event :mark_as_closed do
      transitions :from => :executed, :to => :closed
    end

    event :mark_as_failed do
      transitions :from => :processing, :to => :failed
    end
  end
end
