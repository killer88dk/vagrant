module Vagrant
  module Actions
    module VM
      class Customize < Base
        def execute!
          if !runner.env.config.vm.proc_stack.empty?
            logger.info "Running any VM customizations..."

            # Run the customization procs over the VM
            runner.env.config.vm.run_procs!(@runner.vm)

            # Save the vm
            runner.vm.save
          end
        end
      end
    end
  end
end
