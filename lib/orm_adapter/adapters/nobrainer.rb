require 'nobrainer'
require 'orm_adapter'

module NoBrainer
  module Document
    module ClassMethods
      include OrmAdapter::ToAdapter
    end

    class OrmAdapter < ::OrmAdapter::Base
      # get a list of column names for a given class
      def column_names
        klass.fields.keys
      end

      # @see OrmAdapter::Base#get!
      def get!(id)
        klass.find(wrap_key(id))
      end

      # @see OrmAdapter::Base#get
      def get(id)
        klass.find?(wrap_key(id))
      end

      # @see OrmAdapter::Base#find_first
      def find_first(options = {})
        conditions, order = extract_conditions!(options)
        klass.where(conditions_to_fields(conditions)).order_by(*order_clause(order)).first
      end

      # @see OrmAdapter::Base#find_all
      def find_all(options = {})
        conditions, order, limit, offset = extract_conditions!(options)
        klass.where(conditions_to_fields(conditions)).order_by(*order_clause(order)).limit(limit).offset(offset)
      end

      # @see OrmAdapter::Base#create!
      def create!(attributes = {})
        klass.create(attributes)
      end

      # @see OrmAdapter::Base#destroy
      def destroy(object)
        object.destroy if valid_object?(object)
      end

    protected

      # converts and documents to ids
      def conditions_to_fields(conditions)
        conditions.inject({}) do |fields, (key, value)|
          if value.is_a?(NoBrainer::Document) && column_names.include?(:"#{key}_id")
            fields.merge(:"#{key}_id" => value.id)
          else
            fields.merge(key => value)
          end
        end
      end

      def order_clause(order)
        order.map { |k,v| {k => v} }
      end
    end
  end
end
