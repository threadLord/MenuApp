//
//  Menu.swift
//  MENUApp
//
//  Created by Mac on 14.3.23..
//

import Foundation


import Foundation

// MARK: - Welcome
struct MenuResponse: Codable {
    let status: String?
    let code: Int?
    let data: MenuData?
}

// MARK: - DataClass
struct MenuData: Codable {
    let venues: [VenueElement]?
}

// MARK: - VenueElement
struct VenueElement: Codable, Identifiable {
    
    var id: Int {
        return venue?.id ?? UUID().hashValue
    }
    
    let distance, distanceInMiles: Double?
    let venue: VenueVenue?

    enum CodingKeys: String, CodingKey {
        case distance
        case distanceInMiles = "distance_in_miles"
        case venue
    }
}

// MARK: - VenueVenue
struct VenueVenue: Codable {
    let id: Int?
    let name, code, parentType: String?
    let parentID, companyID, chainID, countryID: Int?
    let currencyID, languageID, storeGroupID, integrationStoreGroupID: Int?
    let externalDlcID: JSONNull?
    let brandID: Int?
    let timezone: Timezone?
    let description, kioskReceiptFooter, imprint, welcomeMessage: String?
    let translations: Translations?
    let address: String?
    let state: Int?
    let city, zip: String?
    let latitude, longitude: Double?
    let taxNumber, phone: String?
    let priceConfiguration: PriceConfiguration?
    let usedPriceConfigurations: [Int]?
    let cuisine, storeURL: String?
    let isShownInDirectory, allowItemComments: Bool?
    let tipDefault, tipMax, serviceCharge, pickupTime: Int?
    let isPickupOnOpenAllowed: Bool?
    let calculationMethod: String?
    let image: Image?
    let availablePaymentMethods: [AvailablePaymentMethod]?
    let country: Country?
    let currency: Currency?
    let orderTypes: [AreaOrderType]?
    let temporaryUpdatedEntities: [JSONAny]?
    let servingTimes: [ServingTime]?
    let isOpen, willOpen, hasDiscounts, hasLoyalty: Bool?
    let hasPromotions, hasDeliveryIntegration: Bool?
    let deliveryIntegrationProperties: JSONNull?
    let deliveryTravelType: String?
    let isCalculatedDeliveryBufferUsed, isMonitoringEnabled, isThreedsEnabled, isFraudDetectionEnabled: Bool?
    let isSmartOrdersEnabled, usePosOrderNumber: Bool?
    let kioskFaceCount: JSONNull?
    let isOrderRegretEnabled, isBillable: Bool?
    let defaultDeliveryBuffer: Int?
    let integration: Integration?
    let createdAt, updatedAt: String?
    let areas: [Area]?
    let menuID: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, code
        case parentType = "parent_type"
        case parentID = "parent_id"
        case companyID = "company_id"
        case chainID = "chain_id"
        case countryID = "country_id"
        case currencyID = "currency_id"
        case languageID = "language_id"
        case storeGroupID = "store_group_id"
        case integrationStoreGroupID = "integration_store_group_id"
        case externalDlcID = "external_dlc_id"
        case brandID = "brand_id"
        case timezone, description
        case kioskReceiptFooter = "kiosk_receipt_footer"
        case imprint
        case welcomeMessage = "welcome_message"
        case translations, address, state, city, zip, latitude, longitude
        case taxNumber = "tax_number"
        case phone
        case priceConfiguration = "price_configuration"
        case usedPriceConfigurations = "used_price_configurations"
        case cuisine
        case storeURL = "store_url"
        case isShownInDirectory = "is_shown_in_directory"
        case allowItemComments = "allow_item_comments"
        case tipDefault = "tip_default"
        case tipMax = "tip_max"
        case serviceCharge = "service_charge"
        case pickupTime = "pickup_time"
        case isPickupOnOpenAllowed = "is_pickup_on_open_allowed"
        case calculationMethod = "calculation_method"
        case image
        case availablePaymentMethods = "available_payment_methods"
        case country, currency
        case orderTypes = "order_types"
        case temporaryUpdatedEntities = "temporary_updated_entities"
        case servingTimes = "serving_times"
        case isOpen = "is_open"
        case willOpen = "will_open"
        case hasDiscounts = "has_discounts"
        case hasLoyalty = "has_loyalty"
        case hasPromotions = "has_promotions"
        case hasDeliveryIntegration = "has_delivery_integration"
        case deliveryIntegrationProperties = "delivery_integration_properties"
        case deliveryTravelType = "delivery_travel_type"
        case isCalculatedDeliveryBufferUsed = "is_calculated_delivery_buffer_used"
        case isMonitoringEnabled = "is_monitoring_enabled"
        case isThreedsEnabled = "is_threeds_enabled"
        case isFraudDetectionEnabled = "is_fraud_detection_enabled"
        case isSmartOrdersEnabled = "is_smart_orders_enabled"
        case usePosOrderNumber = "use_pos_order_number"
        case kioskFaceCount = "kiosk_face_count"
        case isOrderRegretEnabled = "is_order_regret_enabled"
        case isBillable = "is_billable"
        case defaultDeliveryBuffer = "default_delivery_buffer"
        case integration
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case areas
        case menuID = "menu_id"
    }
}

// MARK: - Area
struct Area: Codable {
    let id, typeID: Int?
    let referenceType: String?
    let venueID, menuID, singularPointID: Int?
    let posID: JSONNull?
    let name: String?
    let useTablet: Bool?
    let state, isTableSupported: Int?
    let properties: Properties?
    let orderTypes: [AreaOrderType]?
    let tablePosID: JSONNull?
    let tablet: Tablet?

    enum CodingKeys: String, CodingKey {
        case id
        case typeID = "type_id"
        case referenceType = "reference_type"
        case venueID = "venue_id"
        case menuID = "menu_id"
        case singularPointID = "singular_point_id"
        case posID = "pos_id"
        case name
        case useTablet = "use_tablet"
        case state
        case isTableSupported = "is_table_supported"
        case properties
        case orderTypes = "order_types"
        case tablePosID = "table_pos_id"
        case tablet
    }
}

// MARK: - AreaOrderType
struct AreaOrderType: Codable {
    let id, typeID: Int?
    let referenceType: ReferenceType?
    let state: Int?
    let isTableSupported: Bool?
    let externalChannelOnly: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case typeID = "type_id"
        case referenceType = "reference_type"
        case state
        case isTableSupported = "is_table_supported"
        case externalChannelOnly = "external_channel_only"
    }
}

enum ReferenceType: String, Codable {
    case orderTypeDelivery = "OrderTypeDelivery"
    case orderTypePreorder = "OrderTypePreorder"
    case orderTypeTakeOut = "OrderTypeTakeOut"
}

// MARK: - Properties
struct Properties: Codable {
    let locationType: String?

    enum CodingKeys: String, CodingKey {
        case locationType = "location_type"
    }
}

// MARK: - Tablet
struct Tablet: Codable {
    let id, venueID: Int?
    let token, name: String?
    let useNotifications: Int?
    let showKioskOrders: Bool?
    let kioskNotificationType: Int?
    let middlewareEndpoint, plsName: JSONNull?
    let state: Int?
    let isOnline: Bool?
    let lastRequestAt: String?
    let failureReported, isCritical: Bool?
    let areaIDS: [Int]?

    enum CodingKeys: String, CodingKey {
        case id
        case venueID = "venue_id"
        case token, name
        case useNotifications = "use_notifications"
        case showKioskOrders = "show_kiosk_orders"
        case kioskNotificationType = "kiosk_notification_type"
        case middlewareEndpoint = "middleware_endpoint"
        case plsName = "pls_name"
        case state
        case isOnline = "is_online"
        case lastRequestAt = "last_request_at"
        case failureReported = "failure_reported"
        case isCritical = "is_critical"
        case areaIDS = "area_ids"
    }
}

// MARK: - AvailablePaymentMethod
struct AvailablePaymentMethod: Codable {
    let id, paymentMethodID, paymentMethodTypeID: Int?
    let paymentMethodBrand: PaymentMethodBrand?
    let paymentProcessorTypeID, paymentProcessorID: Int?
    let properties, fraudDetectionProcessorID, visibilityScopes: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case paymentMethodID = "payment_method_id"
        case paymentMethodTypeID = "payment_method_type_id"
        case paymentMethodBrand = "payment_method_brand"
        case paymentProcessorTypeID = "payment_processor_type_id"
        case paymentProcessorID = "payment_processor_id"
        case properties
        case fraudDetectionProcessorID = "fraud_detection_processor_id"
        case visibilityScopes = "visibility_scopes"
    }
}

enum PaymentMethodBrand: String, Codable {
    case masterCard = "MasterCard"
    case visa = "Visa"
}

// MARK: - Country
struct Country: Codable {
    let id, currencyID: Int?
    let name, code, codeAlpha3, codeNumeric: String?
    let callingCode, distanceUnit: String?
    let isAddressNumberFirst: Bool?
    let currencySettings: CurrencySettings?
    let supportedTravelModes: [String]?
    let availablePaymentMethods: [AvailablePaymentMethod]?

    enum CodingKeys: String, CodingKey {
        case id
        case currencyID = "currency_id"
        case name, code
        case codeAlpha3 = "code_alpha3"
        case codeNumeric = "code_numeric"
        case callingCode = "calling_code"
        case distanceUnit = "distance_unit"
        case isAddressNumberFirst = "is_address_number_first"
        case currencySettings = "currency_settings"
        case supportedTravelModes = "supported_travel_modes"
        case availablePaymentMethods = "available_payment_methods"
    }
}

// MARK: - CurrencySettings
struct CurrencySettings: Codable {
    let currencySpace: Bool?
    let decimalSeparator, thousandsSeparator, symbolPosition: String?

    enum CodingKeys: String, CodingKey {
        case currencySpace = "currency_space"
        case decimalSeparator = "decimal_separator"
        case thousandsSeparator = "thousands_separator"
        case symbolPosition = "symbol_position"
    }
}

// MARK: - Currency
struct Currency: Codable {
    let id: Int?
    let code, codeNumeric, symbol: String?
    let roundingUnit, roundingUnitTip: Double?

    enum CodingKeys: String, CodingKey {
        case id, code
        case codeNumeric = "code_numeric"
        case symbol
        case roundingUnit = "rounding_unit"
        case roundingUnitTip = "rounding_unit_tip"
    }
}

// MARK: - Image
struct Image: Codable {
    let thumbnailSmall, thumbnailMedium, fullsize: String?

    enum CodingKeys: String, CodingKey {
        case thumbnailSmall = "thumbnail_small"
        case thumbnailMedium = "thumbnail_medium"
        case fullsize
    }
}

// MARK: - Integration
struct Integration: Codable {
    let id, typeID: Int?
    let referenceType: String?
    let isWindowsPos: Bool?
    let posModifierGroupType: Int?
    let supportComboMeals: Bool?
    let maxCommentLimit: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case typeID = "type_id"
        case referenceType = "reference_type"
        case isWindowsPos = "is_windows_pos"
        case posModifierGroupType = "pos_modifier_group_type"
        case supportComboMeals = "support_combo_meals"
        case maxCommentLimit = "max_comment_limit"
    }
}

// MARK: - PriceConfiguration
struct PriceConfiguration: Codable {
    let orderTypes: [PriceConfigurationOrderType]?
    let externalChannels: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case orderTypes = "order_types"
        case externalChannels = "external_channels"
    }
}

// MARK: - PriceConfigurationOrderType
struct PriceConfigurationOrderType: Codable {
    let typeID, priceConfiguration: Int?

    enum CodingKeys: String, CodingKey {
        case typeID = "type_id"
        case priceConfiguration = "price_configuration"
    }
}

// MARK: - ServingTime
struct ServingTime: Codable {
    let id, typeID: Int?
    let referenceType, timeFrom, timeTo: String?
    let deliveryAt: JSONNull?
    let days: [Int]?

    enum CodingKeys: String, CodingKey {
        case id
        case typeID = "type_id"
        case referenceType = "reference_type"
        case timeFrom = "time_from"
        case timeTo = "time_to"
        case deliveryAt = "delivery_at"
        case days
    }
}

// MARK: - Timezone
struct Timezone: Codable {
    let name, offset: String?
}

// MARK: - Translations
struct Translations: Codable {
    let description: String?
    let kioskReceiptFooter, welcomeMessage: JSONNull?

    enum CodingKeys: String, CodingKey {
        case description
        case kioskReceiptFooter = "kiosk_receipt_footer"
        case welcomeMessage = "welcome_message"
    }
}
