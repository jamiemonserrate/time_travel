class Jobs::DateDependentResqueJob < Jobs::ResqueJob
  @queue = :some_queue_name

  def self.perform
    @current_time = Time.zone.now
  end
end
