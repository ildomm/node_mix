require 'sidekiq/scheduler'

Sidekiq::Scheduler.dynamic = true
Sidekiq::Scheduler.enabled = true
Sidekiq.set_schedule(
    'BP 5 min',
    {
        class: 'BPUpdateWorker',
        cron: '0 */1 * * * *',
        queue: 'default',
        args: 'http://127.0.0.1:8888/',
        description: 'puts bye'
    }
)
