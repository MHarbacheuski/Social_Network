# frozen_string_literal: true

SimpleForm.setup do |config|
  config.wrappers :default, class: :input,
                            hint_class: :field_with_hint, error_class: :field_with_errors, valid_class: :field_without_errors do |b|
    b.use :html5

    b.use :placeholder

    b.optional :maxlength

    # Calculate minlength from length validations for string inputs
    b.optional :minlength

    # Calculates pattern from format validations for string inputs
    b.optional :pattern

    # Calculates min and max from length validations for numeric inputs
    b.optional :min_max

    # Calculates readonly automatically from readonly attributes
    b.optional :readonly

    ## Inputs
    # b.use :input, class: 'input', error_class: 'is-invalid', valid_class: 'is-valid'
    b.use :label_input
    b.use :hint, wrap_with: { tag: :span, class: :hint }
    b.use :error, wrap_with: { tag: :span, class: :error }
  end

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :default

  config.boolean_style = :nested

  # Default class for buttons
  config.button_class = 'btn'

  config.error_notification_tag = :div

  # CSS class to add for error notification helper.
  config.error_notification_class = 'error_notification'

  config.browser_validations = false

  config.boolean_label_class = 'checkbox'
end
