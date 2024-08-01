class ActiveRecord::Base
  #---------------------------------------------------------- DESTROY SECTION

  #-- Redefine in model in case to use a complex destoyable validation
  def destroyable?
    true
  end

  def can_destroy?
    all_relation_valid = self.class.reflect_on_all_associations.all? do |assoc|
      if assoc.options[:dependent] != :restrict && assoc.options[:dependent] != :restrict_with_error
        relation_valid = true
      elsif assoc.macro == :has_one && send(assoc.name).present?
        errors.add(:base,
                   I18n.t('activerecord.errors.messages.restrict_dependent_destroy.has_one',
                          record: assoc.active_record.model_name.human.downcase))
        relation_valid = false
      elsif assoc.macro == :has_many && send(assoc.name).any?
        errors.add(:base,
                   I18n.t('activerecord.errors.messages.restrict_dependent_destroy.has_many',
                          record: assoc.active_record.model_name.human(count: 2).downcase))
        relation_valid = false
      else
        relation_valid = true
      end

      relation_valid == true
    end

    all_relation_valid && destroyable?
  end

  def cannot_destroy?
    !can_destroy?
  end

  #---------------------------------------------------------- EDIT SECTION

  #-- Redefine in model in case to use a complex editable validation
  def editable?
    true
  end

  def can_edit?
    # valid? &&  # <---- Removed to avoid too much processing, leave validation just in form submition
    editable?
  end

  def cannot_edit?
    !can_edit?
  end

  #---------------------------------------------------------- LOG

  #-- Used to evaluate condition of who user trigger the action
  attr_accessor :trigger_user

  #-- For future implementation of logs
  def save_and_log
    ActiveRecord::Base.transaction do
      true if save
    end
  end

  def update_and_log(params)
    ActiveRecord::Base.transaction do
      assign_attributes(params)
      true if can_edit? && save
    end
  end

  def destroy_and_log
    ActiveRecord::Base.transaction do
      true if can_destroy? && destroy
    end
  end
end
