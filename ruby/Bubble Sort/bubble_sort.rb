def bubble_sort(arr)
  left = arr[0]
  right = arr[1]
  unsorted = true
  while unsorted do
    unsorted = false
    i = 0
    while i < (arr.length - 1) do
      if arr[i] > arr[i + 1]
        temp = arr[i]
        arr[i] = arr[i + 1]
        arr[i + 1] = temp
        unsorted = true
        p arr
      end
      i += 1
    end
  end
  arr
end

bubble_sort([4,3,78,2,0,2])