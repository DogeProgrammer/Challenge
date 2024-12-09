# frozen_string_literal: true

module WebpayHelpers
  class WebpayHelperTest
    include WebpayHelpers
  end

  class NullifyXmlCreator
    attr_reader :order

    def initialize(order)
      @order = order
    end

    def call
      dummy_xml
    end

    private

    # rubocop:disable Metrics/AbcSize
    def dummy_xml
      # use Nokogiri builder with UTF-8 encoding
      result = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        # Envelope element with namespace attribute
        xml.Envelope('xmlns:soapenv' => 'http://schemas.xmlsoap.org/soap/envelope/') do
          # add soapenv namespace to root element (cannot be added until namespace is defined)
          xml.parent.namespace = xml.parent.namespace_definitions.find { |ns| ns.prefix == 'soapenv' }

          # Header element
          xml['soapenv'].Header do
            nil # remove?
          end

          # Body element
          xml['soapenv'].Body(
            'xmlns:wsu' => 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd', 'wsu:Id' => 'Body'
          ) do
            xml.nullifyResponse('xmlns:n2' => 'http://service.wswebpay.webpay.transbank.com/') do
              # add ser namespace to nullify element (cannot be added until namespace is defined)
              xml.parent.namespace = xml.parent.namespace_definitions.find { |ns| ns.prefix == 'n2' }

              xml.parent.namespace = nil
              # return element
              xml.return do
                # remove namespace for this element and all children
                xml.authorizationCode order.payment_notification_id
                xml.authorizationDate Time.current.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
                xml.balance '0'
                xml.nullifiedAmount Money.new(order.total, order.store.currency).to_s
              end
            end
          end
        end
      end
      # rubocop:enable Metrics/AbcSize

      result.to_xml
    end
  end
end
