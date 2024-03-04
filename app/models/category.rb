class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '見積書' },
    { id: 3, name: '会議資料' },
    { id: 4, name: '納品書' },
    { id: 5, name: '発注書' },
    { id: 6, name: '社内資料' },
    { id: 7, name: '雑務' },
    { id: 8, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :tasks

end