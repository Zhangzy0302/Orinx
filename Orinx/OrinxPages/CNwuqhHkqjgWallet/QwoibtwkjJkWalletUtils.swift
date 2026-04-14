
import StoreKit
import SwiftUI
import Combine

struct QwoibtwkjJkProduct {
  let qwoibtwkjJkKeyId: String
  let qwoibtwkjJkGetDiamond: Int
  let qwoibtwkjJkPrice: Double
}

let eoquaAfporjxuwProducts: [QwoibtwkjJkProduct] = [
  QwoibtwkjJkProduct(
    qwoibtwkjJkKeyId: "saaauiwzanugqkue", qwoibtwkjJkGetDiamond: 400, qwoibtwkjJkPrice: 0.99),
  QwoibtwkjJkProduct(
    qwoibtwkjJkKeyId: "cufqhwwtruywequl", qwoibtwkjJkGetDiamond: 800, qwoibtwkjJkPrice: 1.99),
  QwoibtwkjJkProduct(
    qwoibtwkjJkKeyId: "uysqkdztrnphvljc", qwoibtwkjJkGetDiamond: 2190, qwoibtwkjJkPrice: 3.99),
  QwoibtwkjJkProduct(
    qwoibtwkjJkKeyId: "qtrvjrldbpuobfhl", qwoibtwkjJkGetDiamond: 2450, qwoibtwkjJkPrice: 4.99),
  QwoibtwkjJkProduct(
    qwoibtwkjJkKeyId: "pczvlytnrqkwmbas", qwoibtwkjJkGetDiamond: 3950, qwoibtwkjJkPrice: 7.99),
  QwoibtwkjJkProduct(
    qwoibtwkjJkKeyId: "vwxfmzjjgzchmnfr", qwoibtwkjJkGetDiamond: 5150, qwoibtwkjJkPrice: 9.99),
  QwoibtwkjJkProduct(
    qwoibtwkjJkKeyId: "mxrjtlqfksahvzne", qwoibtwkjJkGetDiamond: 7700, qwoibtwkjJkPrice: 13.99),
  QwoibtwkjJkProduct(
    qwoibtwkjJkKeyId: "ipuxukzujkqtvbdi", qwoibtwkjJkGetDiamond: 10800, qwoibtwkjJkPrice: 19.99),
  QwoibtwkjJkProduct(
    qwoibtwkjJkKeyId: "zgymxegfnfowecuq", qwoibtwkjJkGetDiamond: 29400, qwoibtwkjJkPrice: 49.99),
  QwoibtwkjJkProduct(
    qwoibtwkjJkKeyId: "kcpisczvlozopdfa", qwoibtwkjJkGetDiamond: 63700, qwoibtwkjJkPrice: 99.99)
]

enum QwoibtwkjJkPurchaseResult {
    case success(diamond: Int)
    case cancelled
    case pending
    case failed(message: String)
}

class QwoibtwkjJkIAPManager: NSObject, ObservableObject {

    @Published var peiALwlxuAwiProducts: [SKProduct] = []

    private var request: SKProductsRequest?
    
    // 当前购买回调
        private var ieudLKjalComple: ((QwoibtwkjJkPurchaseResult) -> Void)?

    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    deinit {
        SKPaymentQueue.default().remove(self)
    }
    
    private var xsieowKXowRetryCount = 0
    private var xsieowKXowTotalRequestCount = 0
    private let xsieowKXowMaxTotalRequestCount = 10
    private var xsieowKXowMaxRetryCount = 10
    private var xsieowKXowIsRequesting = false

    // MARK: - 拉取商品
    func oerianAwcugdFetchProducts() {
        
        // ✅ 最大请求次数限制
        guard xsieowKXowTotalRequestCount < xsieowKXowMaxTotalRequestCount else {
            return
        }
        
        // 防止重复请求
        guard !xsieowKXowIsRequesting else { return }
        
        // 已有数据就不再请求
        guard peiALwlxuAwiProducts.isEmpty else { return }
        
        xsieowKXowIsRequesting = true
        xsieowKXowTotalRequestCount += 1   // ✅ 每次请求都+1
        
        let ids = Set(eoquaAfporjxuwProducts.map { $0.qwoibtwkjJkKeyId })
        
        request = SKProductsRequest(productIdentifiers: ids)
        request?.delegate = self
        request?.start()
    }

    // MARK: - 购买
    func zwkAtihaLbhRecharge(
        _ productKeyId: String,
            completion: @escaping (QwoibtwkjJkPurchaseResult) -> Void
        ) {
            guard SKPaymentQueue.canMakePayments() else {
                completion(.failed(message: "Payments not allowed"))
                return
            }
            
            guard let product = peiALwlxuAwiProducts.first(where: { $0.productIdentifier == productKeyId }) else {
                completion(.failed(message: "Product not found"))
                return
            }
            
            EeuqcjaOrHUD.showLoading(showBackground: true)
            
            // 保存回调
            self.ieudLKjalComple = completion
            
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        }
}

extension QwoibtwkjJkIAPManager: SKProductsRequestDelegate {

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {

        DispatchQueue.main.async {
            self.xsieowKXowIsRequesting = false
            self.xsieowKXowRetryCount = 0   // ✅ 成功后清零
            
            self.peiALwlxuAwiProducts = response.products
            
            print("Loaded:", response.products.map { $0.productIdentifier })
            
            // ⚠️ 如果一个都没拿到，也可以认为失败
            if response.products.isEmpty {
                self.xsieowKXowRetryFetch()
            }
        }
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        
        DispatchQueue.main.async {
            self.xsieowKXowIsRequesting = false
            
            print("Load failed:", error.localizedDescription)
            
            self.xsieowKXowRetryFetch()
        }
    }
    
    private func xsieowKXowRetryFetch() {
        
        xsieowKXowRetryCount += 1
        xsieowKXowTotalRequestCount += 1   // ✅ 只在失败时累计
        
        guard xsieowKXowRetryCount < xsieowKXowMaxRetryCount,
              xsieowKXowTotalRequestCount < xsieowKXowMaxTotalRequestCount else {
            return
        }
        
        let delay = pow(2.0, Double(xsieowKXowRetryCount))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.xsieowKXowRetryFetch()
        }
    }
}

extension QwoibtwkjJkIAPManager: SKPaymentTransactionObserver {
    
    private func findWalletItem(productID: String) -> QwoibtwkjJkProduct? {
        eoquaAfporjxuwProducts.first { $0.qwoibtwkjJkKeyId == productID }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions xowaAwwlTransactions: [SKPaymentTransaction]) {
        
        for xowaAwwlTransaction in xowaAwwlTransactions {
            
            switch xowaAwwlTransaction.transactionState {
                
            case .purchased:
                SKPaymentQueue.default().finishTransaction(xowaAwwlTransaction)
                EeuqcjaOrHUD.hideLoading()
                
                if let chealaliwPro = eoquaAfporjxuwProducts.first(where: {
                    $0.qwoibtwkjJkKeyId == xowaAwwlTransaction.payment.productIdentifier
                }) {
                    ieudLKjalComple?(.success(diamond: chealaliwPro.qwoibtwkjJkGetDiamond))
                }
                ieudLKjalComple = nil
                
                
            case .failed:
                SKPaymentQueue.default().finishTransaction(xowaAwwlTransaction)
                EeuqcjaOrHUD.hideLoading()
                
                if let error = xowaAwwlTransaction.error as? SKError {
                    if error.code == .paymentCancelled {
                        ieudLKjalComple?(.cancelled)
                    } else {
                        ieudLKjalComple?(.failed(message: error.localizedDescription))
                    }
                } else {
                    ieudLKjalComple?(.failed(message: xowaAwwlTransaction.error?.localizedDescription ?? "Unknown error"))
                }
                ieudLKjalComple = nil
                
            case .restored:
                SKPaymentQueue.default().finishTransaction(xowaAwwlTransaction)
                EeuqcjaOrHUD.hideLoading()
                
            case .purchasing:
                break
                
            case .deferred:
                print("Purchase pending")
                ieudLKjalComple?(.pending)
            @unknown default:
                break
            }
        }
    }
}
