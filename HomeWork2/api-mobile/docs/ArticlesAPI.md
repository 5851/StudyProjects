# ArticlesAPI

All URIs are relative to *https://newsapi.org/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**everythingGet**](ArticlesAPI.md#everythingget) | **GET** /everything/ | News List
[**topNewsGet**](ArticlesAPI.md#topnewsget) | **GET** /top-headlines/ | Top News List


# **everythingGet**
```swift
    open class func everythingGet(q: String, from: String, sortBy: String, apiKey: String, page: Int? = nil, completion: @escaping (_ data: ArticleList?, _ error: Error?) -> Void)
```

News List

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let q = "q_example" // String | Theme of news
let from = "from_example" // String | date
let sortBy = "sortBy_example" // String | Sort
let apiKey = "apiKey_example" // String | API key
let page = 987 // Int | number of page (optional)

// News List
ArticlesAPI.everythingGet(q: q, from: from, sortBy: sortBy, apiKey: apiKey, page: page) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **String** | Theme of news | 
 **from** | **String** | date | 
 **sortBy** | **String** | Sort | 
 **apiKey** | **String** | API key | 
 **page** | **Int** | number of page | [optional] 

### Return type

[**ArticleList**](ArticleList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **topNewsGet**
```swift
    open class func topNewsGet(country: String, category: String, apiKey: String, page: Int? = nil, completion: @escaping (_ data: ArticleList?, _ error: Error?) -> Void)
```

Top News List

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let country = "country_example" // String | name of country
let category = "category_example" // String | category news
let apiKey = "apiKey_example" // String | API key
let page = 987 // Int | number of page (optional)

// Top News List
ArticlesAPI.topNewsGet(country: country, category: category, apiKey: apiKey, page: page) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **country** | **String** | name of country | 
 **category** | **String** | category news | 
 **apiKey** | **String** | API key | 
 **page** | **Int** | number of page | [optional] 

### Return type

[**ArticleList**](ArticleList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

