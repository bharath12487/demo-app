class QuestionsController < ApplicationController
    def import_index
    end

    def import
        Question.import(params[:file])
        redirect_to root_url, notice: "Successfully Data imporeted!"
    end

    def index
        questionslist = Question.order('created_at DESC')
        questions = questionslist.limit(params[:limit]).offset(params[:offset])
        total = questionslist ? questionslist.length : 0
        render json: {status: "SUCCESS", data: questions, total: total}, status: :ok
    end

    def show
        question = Question.find(params[:id])
        render json: {status: "SUCCESS", data: question}, status: :ok
    end

    def create
        question = Question.new(question_params)
        if question.save
            render json: {status: "SUCCESS", data: question}, status: :ok
        else
            render json: {status: "ERROR", data: question}, status: :bad_request
        end
    end

    def update
        question = Question.find(params[:id])
        if question.update_attributes(question_params)
            render json: {status: "SUCCESS", data: question}, status: :ok
        else
            render json: {status: "ERROR", data: question}, status: :bad_request
        end
    end

    def destroy
        question = Question.find(params[:id])
        question.destroy
        render json: {status: "SUCCESS", data: question}, status: :ok
    end

    private

    def question_params
        params.permit(:pri,:question,:teaming_stages,:appears,:frequency,:question_type,:condiqtions,:required,:role_id, :mapping_id)
    end
end
