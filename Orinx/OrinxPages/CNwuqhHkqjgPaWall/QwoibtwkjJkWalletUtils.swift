import StoreKit
import SwiftUI
import Combine

struct ORINXVOGUEAtelierPack {
    let ORINXVOGUEsilhouetteKeyId: String
    let ORINXVOGUEwardrobeValue: Int
    let ORINXVOGUErunwayPrice: Double
}

let ORINXVOGUEAtelierCatalog: [ORINXVOGUEAtelierPack] = [
    ORINXVOGUEAtelierPack(ORINXVOGUEsilhouetteKeyId: "zwdrflmmlgmldult", ORINXVOGUEwardrobeValue: 400, ORINXVOGUErunwayPrice: 0.99),
    ORINXVOGUEAtelierPack(ORINXVOGUEsilhouetteKeyId: "vtfuahcerkatvqyc", ORINXVOGUEwardrobeValue: 800, ORINXVOGUErunwayPrice: 1.99),
    ORINXVOGUEAtelierPack(ORINXVOGUEsilhouetteKeyId: "xhgkqjrpvczbmwfl", ORINXVOGUEwardrobeValue: 2190, ORINXVOGUErunwayPrice: 3.99),
    ORINXVOGUEAtelierPack(ORINXVOGUEsilhouetteKeyId: "dtmzkhwjaxpjdfqm", ORINXVOGUEwardrobeValue: 2450, ORINXVOGUErunwayPrice: 4.99),
    ORINXVOGUEAtelierPack(ORINXVOGUEsilhouetteKeyId: "ntydsewvcxuqjzop", ORINXVOGUEwardrobeValue: 3950, ORINXVOGUErunwayPrice: 7.99),
    ORINXVOGUEAtelierPack(ORINXVOGUEsilhouetteKeyId: "xrhllyicvfyfzhnw", ORINXVOGUEwardrobeValue: 5150, ORINXVOGUErunwayPrice: 9.99),
    ORINXVOGUEAtelierPack(ORINXVOGUEsilhouetteKeyId: "plsoujedzxtafvky", ORINXVOGUEwardrobeValue: 7700, ORINXVOGUErunwayPrice: 13.99),
    ORINXVOGUEAtelierPack(ORINXVOGUEsilhouetteKeyId: "xumngoldawuqyzfj", ORINXVOGUEwardrobeValue: 10800, ORINXVOGUErunwayPrice: 19.99),
    ORINXVOGUEAtelierPack(ORINXVOGUEsilhouetteKeyId: "kcvoynhmuuiekjfr", ORINXVOGUEwardrobeValue: 29400, ORINXVOGUErunwayPrice: 49.99),
    ORINXVOGUEAtelierPack(ORINXVOGUEsilhouetteKeyId: "yshvcwlngwikdvqe", ORINXVOGUEwardrobeValue: 63700, ORINXVOGUErunwayPrice: 99.99)
]

enum ORINXVOGUECouturePurchaseResult {
    case ORINXVOGUESuccess(wardrobeValue: Int)
    case ORINXVOGUECancelled
    case ORINXVOGUEPending
    case ORINXVOGUEFailed(message: String)
}

final class ORINXVOGUERunwayIAPManager: NSObject, ObservableObject {

    @Published var ORINXVOGUErunwayStoreProducts: [SKProduct] = []

    private var ORINXVOGUEcatalogRequest: SKProductsRequest?
    private var ORINXVOGUEcoutureCompletion: ((ORINXVOGUECouturePurchaseResult) -> Void)?

    private var ORINXVOGUEatelierRetryCount = 0
    private var ORINXVOGUEatelierTotalRequestCount = 0
    private let ORINXVOGUEatelierMaxTotalRequestCount = 10
    private let ORINXVOGUEatelierMaxRetryCount = 10
    private var ORINXVOGUEatelierIsRequesting = false

    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    deinit {
        SKPaymentQueue.default().remove(self)
    }

    func refreshORINXVOGUERunwayCatalog() {
        guard ORINXVOGUEatelierTotalRequestCount < ORINXVOGUEatelierMaxTotalRequestCount else {
            return
        }

        guard !ORINXVOGUEatelierIsRequesting else { return }
        guard ORINXVOGUErunwayStoreProducts.isEmpty else { return }

        ORINXVOGUEatelierIsRequesting = true
        ORINXVOGUEatelierTotalRequestCount += 1

        let ORINXVOGUEsilhouetteIds = Set(ORINXVOGUEAtelierCatalog.map { $0.ORINXVOGUEsilhouetteKeyId })

        ORINXVOGUEcatalogRequest = SKProductsRequest(productIdentifiers: ORINXVOGUEsilhouetteIds)
        ORINXVOGUEcatalogRequest?.delegate = self
        ORINXVOGUEcatalogRequest?.start()
    }

    func beginORINXVOGUECoutureCheckout(
        _ ORINXVOGUEsilhouetteKeyId: String,
        completion: @escaping (ORINXVOGUECouturePurchaseResult) -> Void
    ) {
        guard SKPaymentQueue.canMakePayments() else {
            completion(.ORINXVOGUEFailed(message: "Payments not allowed"))
            return
        }

        guard let ORINXVOGUEselectedProduct = ORINXVOGUErunwayStoreProducts.first(where: {
            $0.productIdentifier == ORINXVOGUEsilhouetteKeyId
        }) else {
            completion(.ORINXVOGUEFailed(message: "Product not found"))
            return
        }

        EeuqcjaOrHUD.showLoading(showBackground: true)
        ORINXVOGUEcoutureCompletion = completion

        let ORINXVOGUEpayment = SKPayment(product: ORINXVOGUEselectedProduct)
        SKPaymentQueue.default().add(ORINXVOGUEpayment)
    }

    private func ORINXVOGUEscheduleCatalogRetry() {
        ORINXVOGUEatelierRetryCount += 1
        ORINXVOGUEatelierTotalRequestCount += 1

        guard ORINXVOGUEatelierRetryCount < ORINXVOGUEatelierMaxRetryCount,
              ORINXVOGUEatelierTotalRequestCount < ORINXVOGUEatelierMaxTotalRequestCount else {
            return
        }

        let ORINXVOGUEretryDelay = pow(2.0, Double(ORINXVOGUEatelierRetryCount))

        DispatchQueue.main.asyncAfter(deadline: .now() + ORINXVOGUEretryDelay) {
            self.ORINXVOGUEatelierIsRequesting = false
            self.refreshORINXVOGUERunwayCatalog()
        }
    }

    private func ORINXVOGUEfinishCheckout(with result: ORINXVOGUECouturePurchaseResult) {
        EeuqcjaOrHUD.hideLoading()
        ORINXVOGUEcoutureCompletion?(result)
        ORINXVOGUEcoutureCompletion = nil
    }

    private func ORINXVOGUEfindAtelierPack(productID: String) -> ORINXVOGUEAtelierPack? {
        ORINXVOGUEAtelierCatalog.first { $0.ORINXVOGUEsilhouetteKeyId == productID }
    }
}

extension ORINXVOGUERunwayIAPManager: SKProductsRequestDelegate {

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async {
            self.ORINXVOGUEatelierIsRequesting = false
            self.ORINXVOGUEatelierRetryCount = 0
            self.ORINXVOGUErunwayStoreProducts = response.products

            if response.products.isEmpty {
                self.ORINXVOGUEscheduleCatalogRetry()
            }
        }
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.ORINXVOGUEatelierIsRequesting = false
            self.ORINXVOGUEscheduleCatalogRetry()
        }
    }
}

extension ORINXVOGUERunwayIAPManager: SKPaymentTransactionObserver {

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for ORINXVOGUEtransaction in transactions {
            switch ORINXVOGUEtransaction.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(ORINXVOGUEtransaction)

                if let ORINXVOGUEatelierPack = ORINXVOGUEfindAtelierPack(
                    productID: ORINXVOGUEtransaction.payment.productIdentifier
                ) {
                    ORINXVOGUEfinishCheckout(with: .ORINXVOGUESuccess(wardrobeValue: ORINXVOGUEatelierPack.ORINXVOGUEwardrobeValue))
                } else {
                    ORINXVOGUEfinishCheckout(with: .ORINXVOGUEFailed(message: "Product not found"))
                }

            case .failed:
                SKPaymentQueue.default().finishTransaction(ORINXVOGUEtransaction)

                if let ORINXVOGUEerror = ORINXVOGUEtransaction.error as? SKError {
                    if ORINXVOGUEerror.code == .paymentCancelled {
                        ORINXVOGUEfinishCheckout(with: .ORINXVOGUECancelled)
                    } else {
                        ORINXVOGUEfinishCheckout(with: .ORINXVOGUEFailed(message: ORINXVOGUEerror.localizedDescription))
                    }
                } else {
                    ORINXVOGUEfinishCheckout(
                        with: .ORINXVOGUEFailed(message: ORINXVOGUEtransaction.error?.localizedDescription ?? "Unknown error")
                    )
                }

            case .restored:
                SKPaymentQueue.default().finishTransaction(ORINXVOGUEtransaction)
                EeuqcjaOrHUD.hideLoading()

            case .purchasing:
                break

            case .deferred:
                ORINXVOGUEcoutureCompletion?(.ORINXVOGUEPending)

            @unknown default:
                break
            }
        }
    }
}
