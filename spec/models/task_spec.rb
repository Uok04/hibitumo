require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end

  describe 'タスク投稿' do
    context 'タスク投稿できる場合' do
      it 'task_nameとdescriptionとdeadlineとcategory_idが存在すれば登録できる' do
        expect(@task).to be_valid
      end
    end

    context 'タスク投稿できない場合' do
      it 'task_nameが空では登録できない' do
        @task.task_name = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Task name can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @task.description = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Description can't be blank")
      end

      it 'deadlineが空では登録できない' do
        @task.deadline = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Deadline can't be blank")
      end

      it 'category_idが空では登録できない' do
        @task.category_id = '1'
        @task.valid?
        expect(@task.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
