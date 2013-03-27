@Utilities =
  addParametersToURL: (url, parameterName, parameterValue) ->
    otherQueryStringParameters = ""
    urlParts = url.split("?")
    baseUrl = urlParts[0]
    queryString = urlParts[1]
    itemSeparator = ""
    if queryString
      queryStringParts = queryString.split("&")
      i = 0

      while i < queryStringParts.length
        unless queryStringParts[i].split("=")[0] is parameterName
          otherQueryStringParameters += itemSeparator + queryStringParts[i]
          itemSeparator = "&"
        i++
    newQueryStringParameter = itemSeparator + parameterName + "=" + parameterValue
    baseUrl + "?" + otherQueryStringParameters + newQueryStringParameter
