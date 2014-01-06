require 'orm_adapter/adapters/nobrainer'

NoBrainer::Document::ClassMethods.send :include, Devise::Models
